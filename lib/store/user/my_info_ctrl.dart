import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/exception.dart';
import 'package:app/model/api/my_info_dto.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

class MyInfoCtrl extends GetxController with GetDisposableMixin {
  final UID uid;
  final Map? init;
  final Rx<MyInfoDto> dataRx;

  final UserLazyBox _box;


  final modeUnityLoadStatus = RxBool(false);

  MyInfoCtrl(this._box, {required this.uid, this.init}) : dataRx = Rx(MyInfoDto(uid: uid));

  @override
  void onInit() {
    super.onInit();

    _initByBox(init);
  }

  Future<void> _initByBox(Map? init) async {
    if (init != null) {
      _dataRebuild(init);

      _saveToBox();
    } else {
      final info = await _box.use((it) => it.get(PrefKey.MyInfo));

      if (info is Map) {
        dataRx(
          MyInfoDto.fromJson(info.cast()),
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
      return val.copyWith(
        account: result.account,
        avatar: result.avatar,
        avatarEx: result.avatarEx,
        nickName: result.nickName,
        level: result.level,
      );
    });
  }

  MyInfoDto _dataRebuild(Map json) {
    final data = MyInfoDto.fromJson(json.cast());

    return dataRx.rebuild(
      (it) {
        assert(data.uid == it.uid);

        return data;
      },
    );
  }

  static Widget use({required final Widget Function(MyInfoDto) builder}) {
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
  _doUpdate(Future api, {required MyInfoDto Function(MyInfoDto) restore, UserRebuild? updateCommon}) async {
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

  void updateAvatar(AssetEntity asset) {
    simpleSub(
      () async {
        final originFile = await asset.originFile;

        final upFile = await ImageHelp.clip(originFile!, size: asset.size);

        final data = await Api.Common.upImage(
          attach: FileImageAttach(asset: upFile),
        );

        await Api.UserInfo.setInfo(avatar: data.value1);

        return data;
      },
      callback1: (resp) {
        final it = (resp as Tuple3);

        dataRx.rebuild((val) => val.copyWith(avatar: it.value2, avatarEx: it.value3));

        UserInfoCtrl.doUpdate(
          uid,
          rebuild: (val) => val.copyWith(avatar: it.value2, avatarEx: it.value3),
        );

        _saveToBox();
      },
    );
  }

  ///
  /// 更新用户名
  ///
  void updateNick(String nickName) async {
    var result = await Api.UserInfo.setInfo2(nickName);
    if(result != ErrorCode.Ok) {
      if(result == ErrorCode.USER_NAME_MORE_THAN_MAX_LEN) {
        showToast("用户名称超过最大长度");
      } else if(result == ErrorCode.SUSPECTED_SENSITIVE_WORD) {
        showToast("内容涉及敏感词");
      } else if(result == ErrorCode.USER_NAME_IS_EXIST) {
        showToast("用户名称已存在");
      } else {
        showToast("修改失败");
      }
      return;
    }
    dataRx.rebuild((val) => val.copyWith(nickName: nickName));
    UserInfoCtrl.doUpdate(
      uid,
      rebuild: (val) => val.copyWith(nickName: nickName),
    );
    _saveToBox();
  }

  void updateDesc(String data) async {
    final _tmp = dataRx().nickName;

    dataRx.rebuild((val) => val.copyWith(desc: data));

    _doUpdate(
      Api.UserInfo.setInfo(desc: data),
      restore: (val) => val.copyWith(desc: _tmp),
    );
  }

  void updateGender(GenderEnum data) async {
    final _tmp = dataRx().gender;

    dataRx.rebuild((val) => val.copyWith(gender: data));

    _doUpdate(
      Api.UserInfo.setInfo(gender: data),
      restore: (val) => val.copyWith(gender: _tmp),
      updateCommon: (val) => val.copyWith(gender: data),
    );
  }

  void updateBirthDay(DateTime data) async {
    final _tmp = dataRx().birthDay;

    dataRx.rebuild((val) => val.copyWith(birthDay: data));

    _doUpdate(
      Api.UserInfo.setInfo(birth: data),
      restore: (val) => val.copyWith(birthDay: _tmp),
    );
  }

  void updateLotteryWinning(bool isShow) async {
    final _tmp = dataRx().showWinningLottery;

    dataRx.rebuild((val) => val.copyWith(showWinningLottery: isShow));

    _doUpdate(
      Api.UserInfo.showWinningLottery(isShow),
      restore: (val) => val.copyWith(showWinningLottery: _tmp),
    );
  }

//</editor-fold>
}
