import 'dart:convert';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/store/im/im_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class ConvManagerCtrl extends GetxController with GetDisposableMixin {
  final _dataRx = RxMap<String, V2TimConversation>();
  final convRx = RxList<V2TimConversation>();

  final badge = ValueNotifier<int>(0);
  final sysBadgeRx = RxMap<SysConvEnum, Tuple2<V2TimConversation, int>>();

  Future? _cache;
  late final _ready = Get.find<ImAuth>().ready;
  late final _sysExt = <String, Map<String, String>>{};

  late final _convMark = <String>[];

  @override
  void onInit() {
    super.onInit();

    _initEventListener();
  }

  void _initEventListener() {
    void updateBadge(V2TimConversation conv, SysConvEnum type) {
      sysBadgeRx[type] = Tuple2(conv, conv.unreadCount!);
    }

    bindWorker(
      interval<Map<String, V2TimConversation>>(
        _dataRx,
        time: const Duration(milliseconds: 100),
        (data) async {
          final items = data.values.toList(growable: false);

          final showData = <V2TimConversation>[];

          await _fetchSysExt(items);

          for (final item in items) {
            if (item.isSysConv) {
              final type = SysConvEnum.fromVal(_sysExt[item.userID]?['type']);

              if (type == null) {
                assert(false, '数据错误 -> [$item]');
              } else {
                switch (type) {
                  case SysConvEnum.like:
                  case SysConvEnum.at:
                  case SysConvEnum.guest:
                    updateBadge(item, type);
                    showData.add(item);
                    break;
                  case SysConvEnum.follow:
                  case SysConvEnum.news:
                  case SysConvEnum.notice:
                    showData.add(item);
                    break;
                  case SysConvEnum.dressUp:
                  case SysConvEnum.gift:
                    break;
                }
              }
            } else {
              showData.add(item);
            }
          }

          badge.value = showData.map((e) => e.unreadCount ?? 0).sum;

          showData.sort(
            (a, b) {
              final _a = a.orderkey ?? 0;
              final _b = b.orderkey ?? 0;

              return _b.compareTo(_a);
            },
          );

          convRx(showData);
        },
      ),
    );

    final listener = V2TimConversationListener(
      onConversationChanged: (conversationList) {
        _dataRx.addAll(
          conversationList.groupFoldBy((val) => val.conversationID, (_, val) => val),
        );

        xlog('某些会话的关键信息发生变化', level: 0, type: LogType.IM);
      },
      onConversationGroupCreated: (groupName, conversationList) {
        xlog('会话分组被创建', type: LogType.IM);
      },
      onConversationGroupDeleted: (groupName) {
        xlog('会话分组被删除', type: LogType.IM);
      },
      onConversationGroupNameChanged: (oldName, newName) {
        xlog('会话分组名变更', type: LogType.IM);
      },
      onConversationsAddedToGroup: (groupName, conversationList) {
        xlog('会话分组新增会话', type: LogType.IM);
      },
      onConversationsDeletedFromGroup: (groupName, conversationList) {
        xlog('会话分组删除会话', type: LogType.IM);
      },
      onNewConversation: (conversationList) {
        _dataRx.addAll(
          conversationList.groupFoldBy((val) => val.conversationID, (_, val) => val),
        );

        xlog('新会话的回调函数', type: LogType.IM);
      },
      onSyncServerFailed: () {
        xlog('同步服务失败', type: LogType.IM);
      },
      onSyncServerFinish: () {
        doRefresh();

        xlog('同步服务完成', type: LogType.IM);
      },
      onSyncServerStart: () {
        xlog('同步服务开始', type: LogType.IM);
      },
      onTotalUnreadMessageCountChanged: (totalUnreadCount) {
        xlog('会话未读总数改变的回调函数', type: LogType.IM);
      },
    );

    IM.conv.addConversationListener(listener: listener);

    bindWorker(
      Worker(
        () => IM.conv.removeConversationListener(listener: listener),
        'DeleteConvListener',
      ),
    );
  }

  Future<void> _fetchSysExt(List<V2TimConversation> data) async {
    final ids = //
        data
            .where((it) => it.type == ConversationType.V2TIM_C2C && it.isSysConv)
            .map((it) => it.userID!)
            .whereNot((it) => _sysExt.containsKey(it))
            .toList(growable: false);

    if (ids.isNotEmpty) {
      try {
        xlog('获取系统用户拓展信息 -> $ids', level: 0, type: LogType.IM);

        final result = await IM.user.getFriendsInfo(userIDList: ids).dataGet;

        for (final item in result) {
          final info = item.friendInfo?.userProfile;

          if (info != null) {
            Map? data;

            final ext = info.selfSignature;

            if (ext != null && ext.isNotEmpty) {
              try {
                data = jsonDecode(ext);
              } catch (e, s) {
                errLog(e, s);
              }
            }

            _sysExt[info.userID!] = <String, String>{
              'nickName': info.nickName ?? '',
              'avatarUrl': info.faceUrl ?? '',
              if (data != null) ...data,
            };
          }
        }
      } catch (e, s) {
        errLog(e, s);
      }
    }
  }

  void markConvAsRead(SysConvEnum type) async {
    final data = sysBadgeRx[type];

    if (data != null) {
      await IM.chat.markC2CMessageAsRead(userID: data.value1.userID!);

      sysBadgeRx[type] = data.copyWith(value2: 0);
    }
  }

  Future doRefresh() {
    return _cache ??= Future(
      () async {
        await _ready;

        xlog('刷新会话列表', type: LogType.IM);

        try {
          final data = //
              await IM.conv //
                  .getConversationList(nextSeq: '0', count: 100)
                  .dataGet
                  .then((val) => val.conversationList!.whereNotNull());

          _sysExt.clear();

          _dataRx.assignAll(
            data.groupFoldBy((val) => val.conversationID, (_, val) => val),
          );

          xlog(() => '刷新会话列表[成功] -> ${_dataRx.length}', type: LogType.IM);
        } catch (e, s) {
          errLog(e, s, message: '刷新会话列表[失败]', type: LogType.IM);
        }
      },
    ).whenComplete(() => _cache = null);
  }

  void markConvIn(String convId) {
    _convMark.add(convId);
  }

  void markConvOut(String convId) {
    final index = _convMark.lastIndexOf(convId);

    if (index != -1) {
      _convMark.removeAt(index);
    }
  }

  bool canLocalNotify(String convId) {
    final last = _convMark.lastOrNull;

    return last == null || last != convId;
  }
}
