import 'package:app/common/nets/socket/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/real_identity_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({super.key});

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> with ReadyMixin {
  final pwdRx = RxBool(false);
  final imageRx = Rxn<String>();

  // final sceneRx = Rxn<Tuple2<int, String>>();

  final inputs = Map.fromIterable(
    const {'房间名称', '房间公告', '房间密码'},
    value: (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    try {
      final info = await Api.Room.info();

      if (!mounted) return;

      switch (info['status']) {
        case 1:
          return _doJoin(info);
        default:
          _initData(info);
      }
    } catch (e, s) {
      if (e is LogicException) {
        if (Env.isDebugCfg) {
          markReady();

          errLog(e, s);

          return;
        }

        if(Env.isDebug) {
          markReady();
          return;
        }

        switch (e.code) {
          case 16001:
            markReady();
            return;
          case 16202:
            Get.simpleDialog(msg: '请先完成实名认证').then((val) {
              switch (val) {
                case '确定':
                  Get.off(() => const RealIdentityPage());
                  break;
                default:
                  Get.back();
                  break;
              }
            });
            return;
        }
      }

      markFail(e, s);
    }
  }

  Future<void> _doJoin(Map data) async {
    switch (await Get.simpleDialog(msg: '已经在直播啦，进入直播间', cancelLabel: '下播')) {
      case '确定':
        Get.find<RoomManagerCtrl>().toRoom(roomId: data['room_id'], off: true);
        break;
      case '下播':
        simpleSub(
          Api.Room.close(),
          msg: '操作成功',
          whenErr: doBackWhenErr,
          callback: () => _initData(data),
        );
        break;
      default:
        Get.back();
    }
  }

  void _initData(Map data) {
    inputs['房间名称']!.text = data['room_name'] ?? '';
    inputs['房间公告']!.text = data['notice_message'] ?? '';

    imageRx(data['image']);
    // sceneRx(Tuple2(data['scene_id'], data['scene_name']));

    markReady();
  }

  @override
  Widget build(BuildContext context) {
    Widget builder() {
      return SingleChildScrollView(
        padding: const Pad(horizontal: 20, bottom: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            $AvatarView(),
            ...inputs.keys.take(1).expand((it) => $InputView(title: it)),
            ...$InputView(title: '房间公告', multiline: true),
            Spacing.h8,
            $MoreView(),
            Spacing.h32,
            FractionallySizedBox(
              widthFactor: 250 / 375,
              child: XTextBtn(
                label: '开始直播',
                textStyle: const TextStyle(fontSize: 16, fontWeight: fw$Medium),
                onTap: doSub,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: xAppBar(),
      body: readyBuild(builder: builder),
    );
  }

  Widget $AvatarView() {
    const double size = 88;

    Widget child = Obx(
      () => NetImage(imageRx(), width: size, height: size, fit: BoxFit.cover),
    );

    child = Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(IMG.$('room/房间封面'), scale: 3, fit: BoxFit.fitWidth),
        ),
      ],
    );

    child = OpacityButton(
      child: child,
      onTap: () {
        imagePicker(
          max: 1,
          okCall: (it) async {
            simpleSub(
              () async {
                final asset = it.first;

                final originFile = await asset.originFile;
                final upFile = await ImageHelp.clip(originFile!, size: asset.size);

                return await Api.Common.upImage(
                  attach: FileImageAttach(asset: upFile),
                );
              },
              callback1: (resp) => imageRx((resp as Tuple3).value2),
            );
          },
        );
      },
    );

    return Container(
      width: size,
      height: size,
      margin: const Pad(top: 20),
      clipBehavior: Clip.hardEdge,
      decoration: const ShapeDecoration(shape: AppShape.a4),
      child: child,
    );
  }

  Widget $MoreView() {
    return Obx(
      () {
        final hasPwd = pwdRx();

        return TableView(
          [
            TableGroup(
              [
                // Obx(() => TableItem(title: '场景', tips: sceneRx()?.value2, onTap: selectScene)),
                // TableItem$Action(title: '人数上限', action: const AppText('--')),
                TableItem$Switch(title: '私密', isChecked: hasPwd, onChanged: pwdRx),
                if (hasPwd)
                  TableItem$Action(
                    title: '房间密码',
                    action: Expanded(child: $PwdInputView()),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  InputDecoration $InputDecor(String hint, {bool multiline = false}) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: AppBorderRadius.a4,
    );

    return InputDecoration(
      hintText: '请输入$hint',
      hintStyle: const TextStyle(fontSize: 12),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      contentPadding: multiline ? const Pad(all: 10) : const Pad(horizontal: 10),
      border: inputBorder,
    );
  }

  Iterable<Widget> $InputView({required String title, bool multiline = false}) {
    final lines = multiline ? 5 : 1;

    return [
      Box(
        padding: const Pad(top: 20, bottom: 5),
        alignment: Alignment.topLeft,
        child: XText(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
        ),
      ),
      TextField(
        controller: inputs[title],
        maxLines: lines,
        minLines: lines,
        style: const TextStyle(fontSize: 14),
        decoration: $InputDecor(title, multiline: multiline),
      ),
    ];
  }

  Widget $PwdInputView() {
    return SizedBox(
      height: 30,
      child: TextField(
        controller: inputs['房间密码'],
        decoration: $InputDecor('房间密码'),
        obscureText: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }

  // void selectScene() {
  //   Get.to(() => const ScenePage())?.onType<Map>((val) {
  //     sceneRx(
  //       Tuple2(val['id'], val['name']),
  //     );
  //   });
  // }

  Future<void> doSub() async {
    final title = inputs.by('房间名称');
    final notice = inputs.by('房间公告');
    final pwd = inputs.by('房间密码');
    // final scene = sceneRx();
    final image = imageRx();

    if(Env.isRelease) {
      if (image == null) {
        showToast('请上传封面');

        return;
      }
    }

    if (title.isEmpty) {
      showToast('请输入房间名称');

      return;
    }

    // if (scene == null) {
    //   showToast('请选择直播场景');
    //
    //   return;
    // }

    if (pwdRx() && pwd.isEmpty) {
      showToast('请输入房间密码');

      return;
    }
    // 创建房间
    S_CreateScene? response = await Api.Room.open(
        title: title,
        image: image,
        notice: notice,
        pwd: pwd);
    // 获取到sceneId
    int? roomId = response?.roomId;
    if(roomId == null) {
      return;
    }
    Get.find<RoomManagerCtrl>().toRoom(roomId: roomId, off: true);
  }
}
