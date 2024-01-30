import 'package:app/event/event.dart';
import 'package:app/model/api/user_info_dto.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/extension.dart';

export 'package:app/model/api/user_info_dto.dart';

typedef UserRebuild = UserInfoDto Function(UserInfoDto);

class UserInfoCtrl extends GetxController with UserLazyBoxDisposableMixin<Map>, BusGetLifeMixin {
  @override
  final UID uid;
  @override
  final String boxName = 'UserInfo';

  UserInfoCtrl({required this.uid});

  static UserInfoCtrl get ins {
    return Get.find<UserInfoCtrl>();
  }

  final _cache = <String, Rxn<UserInfoDto>>{};

  final _task = <UID, Future<bool>>{};
  final _taskDb = <UID, Future<bool>>{};
  final _taskNet = <UID, Completer<bool>>{};
  final _batchTask = <UID, Completer<bool>>{};

  @override
  void onReady() {
    on<UserLevelUpEvent>(
      (event) {
        doUpdate(
          event.uid ?? "",
          rebuild: (val) {
            return val.copyWith(level: event.data?.level.toString());
          },
        );
      },
    );

    on<UserCharmUpEvent>(
      (event) {
        event.data?.items.forEach((element) {
          doUpdate(
            element.uid,
            rebuild: (val) {
              val.copyWith(charmLevel: element.charmLevel.toString());
              return val;
            },
          );
        });
      },
    );
  }

  Rxn<UserInfoDto> _getOrCreate(UID uid) {
    return _cache.putIfAbsent(uid, () => Rxn<UserInfoDto>());
  }

  Future<Map<UID, Completer<bool>>> _pullBatch() {
    return _batchTask.synchronized(() {
      final _tmp = {..._batchTask};

      _batchTask.clear();

      return _tmp;
    });
  }

  void _runTask() async {
    final task = await _pullBatch();
    if (task.isEmpty) return;

    _taskNet.addAll(task);

    late final Map<UID, UserInfoDto> items;

    try {
      items = //
          await Api.UserInfo.simple(task.keys.toList(growable: false)) //
              .then((it) => it.map((k, v) => MapEntry(k, UserInfoDto.fromApi(k, v))));
    } catch (e, s) {
      errLog(e, s);

      for (final it in task.keys) {
        _taskNet.remove(it)?.complete(false);
      }

      return;
    }

    for (final uid in task.keys) {
      final completer = _taskNet[uid]!;

      try {
        final info = items[uid];

        if (info == null) {
          completer.complete(false);
        } else {
          _getOrCreate(uid)(await _saveToDb(uid, info));

          completer.complete(true);
        }
      } catch (e, s) {
        errLog(e, s);

        completer.complete(false);
      } finally {
        _taskNet.remove(uid);
      }
    }
  }

  Future<bool> _loadByDbOrNet(UID uid, bool useNet, {bool forceUseNet = false}) {
    return _task.putIfAbsent(uid, () async {
      try {
        if(forceUseNet) {
          return await loadByNet(uid);
        }
        return (await _loadByDb(uid)) || (useNet ? await loadByNet(uid) : false);
      } finally {
        _task.remove(uid);
      }
    });
  }

  Future<bool> _loadByDb(UID uid) {
    xlog('LoadByDb -> $uid', level: 0);

    return _taskDb.putIfAbsent(uid, () async {
      try {
        final result = await box.use((box) => box.get(uid));

        if (result != null) {
          _getOrCreate(uid)(UserInfoDto.fromJson(result.cast()));

          return true;
        }
      } catch (e, s) {
        errLog(e, s);
      } finally {
        _taskDb.remove(uid);
      }

      return false;
    });
  }

  Future<UserInfoDto> _saveToDb(UID uid, UserInfoDto data) async {
    await box.use((box) => box.put(uid, data.toJson()));

    return data;
  }

  Rxn<UserInfoDto> simpleFetch(UID uid, {bool refresh = false, forceUseNet = false}) {
    final rxVal = _getOrCreate(uid);

    if (rxVal.isNull() || refresh || forceUseNet) _loadByDbOrNet(uid, true, forceUseNet: forceUseNet);

    return rxVal;
  }

  Future<bool> loadByNet(UID uid) {
    if (uid.isEmpty) return Future.value(false);

    xlog('LoadByNet -> $uid');

    Completer<bool> _subTask() {
      post(_runTask);

      return Completer<bool>();
    }

    return (_taskNet[uid] ?? _batchTask.putIfAbsent(uid, _subTask)).future;
  }

  Future<UserInfoDto> findByUid(UID uid) async {
    return await findByUidOrNull(uid, useNet: true) ?? (throw 'Err');
  }

  Future<UserInfoDto?> findByUidOrNull(UID uid, {required bool useNet}) async {
    final rxVal = _getOrCreate(uid);

    return rxVal() ?? (await _loadByDbOrNet(uid, useNet) ? rxVal() : null);
  }

  Future<UserInfoDto?> findByUidOrNull2(UID uid, {required bool forceUseNet}) async {
    if(_cache.containsKey(uid)) {
      _cache.remove(uid);
    }

    final rxVal = _getOrCreate(uid);

    return await _loadByDbOrNet(uid, forceUseNet) ? rxVal() : null;
  }

  Future<Map<UID, UserInfoDto>> findByUidX(Iterable<UID> uid, {required bool useNet}) async {
    return {
      for (final item in await Future.wait(uid.map((it) => findByUidOrNull(it, useNet: useNet))))
        if (item != null) item.uid: item,
    };
  }

  Future<void> _doUpdate(UID uid, {required UserRebuild rebuild}) async {
    final infoCtrl = Get.find<UserInfoCtrl>();

    if (await infoCtrl.findByUidOrNull(uid, useNet: false) != null) {
      final data = infoCtrl.simpleFetch(uid).rebuild((it) => rebuild(it!));

      if (data != null) {
        await infoCtrl._saveToDb(uid, data);
      }
    }
  }

  static Future<void> doUpdate(UID uid, {required UserRebuild rebuild}) {
    return Get.find<UserInfoCtrl>()._doUpdate(uid, rebuild: rebuild);
  }

  static Widget use(UID uid, {required Widget Function(UserInfoDto?) builder, bool refresh = false, bool forceUseNet = false}) {
    assert(uid != '${null}');

    final rxVal = Get.find<UserInfoCtrl>().simpleFetch(uid, refresh: refresh, forceUseNet: forceUseNet);

    return KeyedSubtree(
      key: Key(uid),
      child: Obx(() => builder(rxVal())),
    );
  }

  static Widget useX(Set<UID> ids, {required Widget Function(Map<UID, UserInfoDto?>) builder}) {
    final ctrl = Get.find<UserInfoCtrl>();

    return Builder(
      builder: (_) {
        final data = {
          for (final uid in ids) //
            uid: ctrl.simpleFetch(uid),
        };

        return Obx(() => builder(data.map((k, v) => MapEntry(k, v.value))));
      },
    );
  }
}
