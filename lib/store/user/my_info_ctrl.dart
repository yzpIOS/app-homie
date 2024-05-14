import 'dart:io';
import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/api/user_info_model.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

class MyInfoCtrl extends GetxController with GetDisposableMixin {
  final UID uid;
  final Map? init;
  final Rx<UserInfoModel> dataRx;
  final UserLazyBox _box;
  final modeUnityLoadStatus = RxBool(false);

  MyInfoCtrl(this._box, {required this.uid, this.init})
      : dataRx = Rx(UserInfoModel(uid: uid));

  @override
  void onInit() {
    super.onInit();
    _initByBox(init);
    doRefresh();
  }

  Future<void> _initByBox(Map? init) async {
    if (init != null) {
      _dataRebuild(init);

      _saveToBox();
    } else {
      final info = await _box.use((it) => it.get(PrefKey.MyInfo));

      if (info is Map) {
        dataRx(
          UserInfoModel.fromJson(info.cast()),
        );
      }

      await doRefresh();
    }
  }

  Future<void> _saveToBox() {
    return _box.use(
      (it) => it.put(PrefKey.MyInfo, dataRx().toJson()),
    );
  }

  Future<void> doRefresh() async {
    final result = _dataRebuild(await Api.UserInfo.myInfo());
    UserInfoCtrl.doUpdate(uid, rebuild: (val) {
      val.account = result.account;
      val.avatarUrl = result.avatarUrl;
      val.avatarExtra = result.avatarExtra;
      val.nickName = result.nickName;
      val.level = result.level;
      val.ageShow = result.ageShow;
      val.starSign = result.starSign;
      val.location = result.location;
      val.avatarFrame = result.avatarFrame;
      val.voicePartyBackground = result.voicePartyBackground;
      val.approachSpecialEffect = result.approachSpecialEffect;
      val.chatBubble = result.chatBubble;
      return val;
    });
    dataRx.value = result;
  }

  UserInfoModel _dataRebuild(Map json) {
    final data = UserInfoModel.fromJson(json.cast());

    return dataRx.rebuild(
      (it) {
        assert(data.uid == it.uid);

        return data;
      },
    );
  }

  static Widget use({required final Widget Function(UserInfoModel) builder}) {
    return GetX<MyInfoCtrl>(
      builder: (it) {
        try {
          return builder(it.dataRx());
        } catch (e, s) {
          errLog(e, s);

          return Spacing.blank;
        }
      },
    );
  }

//<editor-fold desc="Api">
  _doUpdate(Future api,
      {required UserInfoModel Function(UserInfoModel) restore,
      UserRebuild? updateCommon}) async {
    try {
      await api;

      _saveToBox();

      if (updateCommon != null) {
        UserInfoCtrl.doUpdate(uid, rebuild: updateCommon);
      }
    } catch (e, s) {
      errLog(e, s);

      if (e is LogicException) showToast(e.msg);

      dataRx.rebuild(restore);
    }
  }

  // void updateAvatar(AssetEntity asset) {
  void updateAvatar(String path) {
    simpleSub(
      () async {
        // final originFile = await asset.originFile;
        // final upFile = await ImageHelp.clip(originFile!, size: asset.size);

        final originFile = File(path);
        final upFile = await ImageHelp.clip(originFile);
        final data = await Api.Common.upImage(
          attach: FileImageAttach(asset: upFile),
        );

        await Api.UserInfo.setInfo(avatar: data.value1);

        return data;
      },
      callback1: (resp) {
        final it = (resp as Tuple4);

        dataRx.rebuild((val) {
          val.avatarUrl = it.value2;
          val.avatarExtra = it.value3;
          return val;
        });

        UserInfoCtrl.doUpdate(uid, rebuild: (val) {
          val.avatarUrl = it.value2;
          val.avatarExtra = it.value3;
          return val;
        });

        _saveToBox();
      },
    );
  }

  ///
  /// 更新用户名
  ///
  void updateNick(String nickName) async {
    var result = await Api.UserInfo.setInfo2(nickName);
    if (result != ErrorCode.Ok) {
      if (result == ErrorCode.USER_NAME_MORE_THAN_MAX_LEN) {
        showToast("用户名称超过最大长度");
      } else if (result == ErrorCode.SUSPECTED_SENSITIVE_WORD) {
        showToast("内容涉及敏感词");
      } else if (result == ErrorCode.USER_NAME_IS_EXIST) {
        showToast("用户名称已存在");
      } else {
        showToast("修改失败");
      }
      return;
    }
    dataRx.rebuild((val) {
      val.nickName = nickName;
      return val;
    });
    UserInfoCtrl.doUpdate(uid, rebuild: (val) {
      val.nickName = nickName;
      return val;
    });
    _saveToBox();
  }

  void updateDesc(String data) async {
    final _tmp = dataRx().desc;
    dataRx.rebuild((val) {
      val.desc = data;
      return val;
    });

    _doUpdate(
      Api.UserInfo.setInfo(desc: data),
      restore: (val) {
        val.desc = _tmp;
        return val;
      },
      updateCommon: (val) {
        val.desc = data;
        return val;
      },
    );
  }

  void updateGender(GenderEnum data) async {
    final _tmp = dataRx().gender;
    dataRx.rebuild((val) {
      val.gender = data;
      return val;
    });

    _doUpdate(
      Api.UserInfo.setInfo(gender: data),
      restore: (val) {
        val.gender = _tmp;
        return val;
      },
      updateCommon: (val) {
        val.gender = data;
        return val;
      },
    );
  }

  // 更新生日+星座
  void updateBirthDay(DateTime data) async {
    final _tmp = dataRx().birthDay;
    final _tmpStarSign = dataRx().starSign;
    final starSign = getConstellation(data);
    dataRx.rebuild((val) {
      val.birthDay = data;
      val.starSign = starSign;
      return val;
    });

    await _doUpdate(
      Api.UserInfo.setInfo(birth: data, starSign: starSign),
      restore: (val) {
        val.birthDay = _tmp;
        val.starSign = _tmpStarSign;
        return val;
      },
      updateCommon: (val) {
        val.birthDay = data;
        val.starSign = starSign;
        return val;
      },
    );

    // 请求数据刷新界面(刷新年龄)
    const UserInfoRefreshEvent().fire();
  }

  // 更新地区
  void updateLocation(String data) async {
    final _tmp = dataRx().location;
    dataRx.rebuild((val) {
      val.location = data;
      return val;
    });

    _doUpdate(
      Api.UserInfo.setInfo(location: data),
      restore: (val) {
        val.location = _tmp;
        return val;
      },
      updateCommon: (val) {
        val.location = data;
        return val;
      },
    );
  }

  // 获取星座
  String? getConstellation(DateTime? data) {
    if (data == null) {
      return null;
    }
    return TimeUtils.getConstellationWith(data);
  }

  void updateLotteryWinning(bool isShow) async {
    final _tmp = dataRx().showWinningLottery;
    dataRx.rebuild((val) {
      val.showWinningLottery = isShow;
      return val;
    });

    _doUpdate(
      Api.UserInfo.showWinningLottery(isShow),
      restore: (val) {
        val.showWinningLottery = _tmp;
        return val;
      },
    );
  }

//</editor-fold>
}
