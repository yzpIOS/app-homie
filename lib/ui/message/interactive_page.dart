import 'dart:convert';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/api/moment_dto.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/special_text.dart';
import 'package:app/types.dart';
import 'package:app/ui/moment/detail/moment_detail_page.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef Item = Tuple2<V2TimMessage, Map>;

class InteractivePage extends StatefulWidget {
  final SysConvEnum type;

  const InteractivePage({super.key, required this.type});

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  late final type = widget.type;
  late final badgeRx = Get.find<ConvManagerCtrl>().sysBadgeRx;

  @override
  void dispose() {
    super.dispose();

    Get.find<ConvManagerCtrl>().markConvAsRead(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: type.label),
      body: _DataView(type, badgeRx),
    );
  }
}

class _DataView extends SimplePageView<Item?> {
  final SysConvEnum type;
  final RxMap<SysConvEnum, Tuple2<V2TimConversation, int>> badgeRx;

  _DataView(this.type, this.badgeRx);

  @override
  Future fetchPage(PageNum page) async {
    final conv = badgeRx[type]?.value1;

    if (conv == null) return null;

    final api = IM.chat.getC2CHistoryMessageList(
      count: page.size,
      userID: conv.userID!,
      lastMsgID: controller.data.lastOrNull?.value1.msgID,
    );

    return api.dataGet;
  }

  @override
  DataTr<Item?> get transform {
    return (data) sync* {
      for (final V2TimMessage item in data) {
        try {
          final ext = jsonDecode(item.cloudCustomData!);

          ext['data'] = jsonDecode(ext['data']);

          yield Item(item, ext);
        } catch (e, s) {
          errLog(e, s);
        }
      }
    };
  }

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 10, endIndent: 10),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Item? item, int index) {
    if (item == null) return _$ErrView();

    switch (type) {
      case SysConvEnum.like:
        return _ItemView$Like(item: item);
      case SysConvEnum.at:
        return _ItemView$At(item: item);
      default:
        return _$ErrView();
    }
  }
}

abstract class _ItemView extends StatelessWidget {
  final V2TimMessage conv;
  final Map data;
  final Map attr;

  _ItemView({required Item item})
      : conv = item.value1,
        data = item.value2,
        attr = item.value2['data'];

  @override
  Widget build(BuildContext context) {
    final UID uid = attr['uid'];
    final String? cover = attr['cover'];

    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfoCtrl.use(
          uid,
          builder: (it) => XText(
            it?.showName() ?? '',
            style: const TextStyle(fontSize: 14, color: AppPalette.c3, fontWeight: fw$Medium),
          ),
        ),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 12, color: AppPalette.c6),
          child: $TipsView(),
        ),
        XText(
          conv.msgTime?.fromNow() ?? '',
          style: const TextStyle(fontSize: 12, color: AppPalette.c9),
        ),
      ].separator(Spacing.h4).toList(growable: false),
    );

    child = Row(
      children: [
        AsyncAvatar(uid: uid, size: 50),
        Expanded(child: child),
        if (cover != null)
          ClipRRect(
            borderRadius: AppBorderRadius.a6,
            child: NetImage(cover, width: 80, height: 80, fit: BoxFit.cover),
          ),
      ].separator(Spacing.w10).toList(growable: false),
    );

    child = Box(
      height: 100,
      padding: const Pad(horizontal: 10),
      child: child,
    );

    child = InkWell(
      onTap: onItemClick,
      child: child,
    );

    return child;
  }

  Widget $TipsView();

  void onItemClick();

  void toMoment() {
    simpleSub(
      Api.Moment.detail(id: int.parse('${attr['dynamic_id']}')),
      callback1: (resp) {
        if (resp != null) {
          Get.to(() => MomentDetailPage(MomentDtoAdapter(Rx(MomentDto.fromJson(resp)))));
        } else {
          showToast('动态不存在');
        }
      },
    );
  }
}

class _ItemView$Like extends _ItemView {
  _ItemView$Like({required super.item});

  @override
  Widget $TipsView() {
    String type = '';

    switch (data['category']) {
      case 1:
        type = '的动态';
        break;
      case 2:
        type = '的评论';
        break;
    }

    return XText('赞了你$type');
  }

  @override
  void onItemClick() => toMoment();
}

class _ItemView$At extends _ItemView {
  _ItemView$At({required super.item});

  @override
  Widget $TipsView() {
    return Builder(
      builder: (context) {
        final String? text = attr['comment'];

        return XRichText(
          TextSpan(
            children: [
              const TextSpan(text: '回复我：'),
              if (text != null) context.watch<SpecialTextSpanBuilder?>().build(text: text),
            ],
          ),
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  @override
  void onItemClick() => toMoment();
}

Widget _$ErrView() {
  // ignore: deprecated_member_use
  return Env.isDebug ? const Box.rand(height: 100) : const Box(height: 100);
}
