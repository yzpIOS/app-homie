import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/real_identity_2_page.dart';
import 'package:app/ui/my/real_identity_page.dart';
import 'package:app/ui/podcast/scene_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// 开直播
class OpenLiveRoomPage extends StatefulWidget {
  const OpenLiveRoomPage({super.key});

  @override
  State<OpenLiveRoomPage> createState() => _OpenLiveRoomPageState();
}

class _OpenLiveRoomPageState extends State<OpenLiveRoomPage>
    with ReadyMixin {
  final imageRx = Rxn<String>(); //直播头像
  final contentCountRx = RxInt(0); //房间公告字数
  final Rxn<Tuple2<int, String>>sceneRx = Rxn<Tuple2<int, String>>(); //场景
  final freeMicRx = RxBool(false); //是否自由麦
  final pactRx = RxBool(false); //是否选中直播规范
  final inputs = Map.fromIterable(
    const {'房间名称', '房间公告',},
    value: (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();

    final noticeController = inputs['房间公告'];
    noticeController?.addListener(() {
      contentCountRx.value = noticeController.text.length;
    });

    _init();
  }

  void _init() async {
    try {
      final info = await Api.Room.info();

      if (!mounted) return;

      if(!OAuthCtrl.isFaceValidate) {
        throw const LogicException(16202, "请先完成实名认证");
      }

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

        switch (e.code) {
          case 16001:
            markReady();
            return;
          case 16202:
            Get.simpleDialog(msg: '请先完成实名认证').then((val) {
              switch (val) {
                case '确定':
                  Get.off(() => const RealIdentity2Page());
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
    switch (await Get.simpleDialog(
        msg: '已经在直播啦，进入直播间', cancelLabel: '下播')) {
      case '确定':
        Get.find<RoomManagerCtrl>().toRoom(roomId: data['room_id'], off: true);
        break;
      case '下播':
        if (Get
            .find<RoomManagerCtrl>()
            .sceneCtrl2 == null) {
          await RoomManagerCtrl.ins.doCloseState();
          Get.back();
          return;
        }
        // 关闭函数
        Function closeFunc;
        // 房间
        RoomCtrl? roomCtrl = Get
            .find<RoomManagerCtrl>()
            .sceneCtrl as RoomCtrl?;
        if (roomCtrl != null && roomCtrl.roomType != RoomType.guild && roomCtrl
            .getRole(OAuthCtrl.uid)
            .isOwner) {
          // 不是公会，并且用户所在的房间是主人房
          closeFunc = () async {
            // 请求关闭
            await Api.Room.close();
            // 关闭房间
            await Get.find<RoomManagerCtrl>().doCloseState();
          };
        } else {
          // 房间manager
          closeFunc = Get
              .find<RoomManagerCtrl>()
              .doCloseState;
        }
        simpleSub(
          closeFunc.call(),
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
    // inputs['房间名称']!.text = data['room_name'] ?? '';
    // inputs['房间公告']!.text = data['notice_message'] ?? '';
    // imageRx(data['image']);
    // sceneRx(Tuple2(data['scene_id'], data['scene_name']));

    markReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '开直播',),
      resizeToAvoidBottomInset: false, //是否调整大小以避免底部嵌入(防止开始直播按钮上移)
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: const Pad(horizontal: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    $LiveCover(),
                    ...$InputView(title: inputs.keys.first, multiline: false),
                    ...$InputView(title: inputs.keys.last, multiline: true),
                    ...$MoreView(),
                  ],
                )
            ),
          ),
          $BottomActionView(),
        ],
      ),
    );
  }

  Widget $LiveCover() {
    const double size = 85;

    Widget child = Obx(() {
      String? image = imageRx();

      if (image != null && image.isNotEmpty) {
        return NetImage(image, fit: BoxFit.cover);
      }

      return Column(
        children: [
          Expanded(
            child: Image.asset(
              IMG.format('my/rb_icon_jia'), width: 27, height: 27, scale: 3,),
          ),
          Container(
            width: double.infinity,
            height: 19,
            color: const Color(0xFF282828).withAlpha(80),
            child: const XText(
              '添加头像',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,
                  color: AppPalette.txtDark,
                  fontWeight: fw$Regular),
            ),
          )
        ],
      );
    });

    child = Center(
      child: OpacityButton(
        child: Container(
          width: size,
          height: size,
          margin: const Pad(top: 21),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const ShapeDecoration(
            color: AppPalette.background2,
            shape: XRectangleBorder(
              borderRadius: AppBorderRadius.a10,
              side: BorderSide(width: 0.5, color: Color(0xFFDFDFDF),),
            ),
          ),
          child: child,
        ),
        onTap: () {
          imagePicker(
            max: 1,
            okCall: (it) async {
              simpleSub(
                    () async {
                  final asset = it.first;

                  final originFile = await asset.originFile;
                  final upFile = await ImageHelp.clip(
                      originFile!, size: asset.size);

                  return await Api.Common.upImage(
                    attach: FileImageAttach(asset: upFile),
                  );
                },
                callback1: (resp) => imageRx((resp as Tuple4).value2),
              );
            },
          );
        },
      ),
    );

    return child;
  }

  InputDecoration $InputDecor(String hint, {bool multiline = false}) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: AppBorderRadius.a6,
    );

    return InputDecoration(
      hintText: '请输入$hint',
      hintStyle: const TextStyle(fontSize: 12, color: AppPalette.colorA9,),
      filled: true,
      fillColor: AppPalette.colorEB,
      contentPadding: multiline ? const Pad(all: 10) : const Pad(
          horizontal: 10),
      border: inputBorder,
    );
  }

  Iterable<Widget> $InputView({required String title, bool multiline = false}) {
    final int lines = multiline ? 4 : 1;
    final double top = multiline ? 20 : 39;

    return [
      Padding(
        padding: Pad(top: top, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: XText(
                title,
                style: const TextStyle(
                    fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
              ),
            ),
            if (multiline)
              Obx(() {
                return XRichText(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$contentCountRx/',
                        style: const TextStyle(color: AppPalette.colorA9),
                      ),
                      const TextSpan(text: '150',),
                    ],
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppPalette.txtDark,
                        fontWeight: fw$Regular),
                  ),
                );
              }),
          ],
        ),
      ),
      TextField(
        controller: inputs[title],
        inputFormatters: multiline
            ? [LengthLimitingTextInputFormatter(150)]
            : null,
        //限制长度
        maxLines: lines,
        minLines: lines,
        style: const TextStyle(fontSize: 14),
        decoration: $InputDecor(title, multiline: multiline),
      ),
    ];
  }

  Iterable<Widget> $MoreView() {
    return [
      // OpacityButton(
      //   onTap: selectScene,
      //   child: Container(
      //     margin: const Pad(top: 20),
      //     height: 44,
      //     child: Row(
      //       children: [
      //         const Expanded(
      //           child: XText(
      //             '场景',
      //             style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
      //           ),
      //         ),
      //         Obx(() {
      //           return XRichText(
      //             TextSpan(
      //               children: [
      //                 TextSpan(text: sceneRx()?.value2,),
      //                 const WidgetSpan(child: RightArrowIcon(color: AppPalette.primary,), alignment: PlaceholderAlignment.middle,),
      //               ],
      //               style: const TextStyle(fontSize: 15, color: AppPalette.primary, fontWeight: fw$Medium),
      //             ),
      //           );
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
      // const Divider(height: 1, color: Color(0xFFE3E7ED),),
      OpacityButton(
        onTap: () => freeMicRx.toggle(),
        child: Container(
          height: 44,
          margin: const Pad(top: 20),
          child: Row(
            children: [
              const Expanded(
                child: XText(
                  '自由麦',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
                ),
              ),
              Obx(() => Image.asset(IMG.format(freeMicRx() ? 'my/rb_icon_kai' : 'my/rb_icon_guan'), width: 49.5, height: 26,),),
            ],
          ),
        ),
      ),
      const Divider(height: 1, color: Color(0xFFE3E7ED),),
    ];
  }

  Widget $BottomActionView() {
    Widget child = Column(
      children: [
        $PactTxt(),
        Spacing.h10,
        XTextBtn(
          height: 42,
          label: '开始直播',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$Medium),
          onTap: doStartLive,
        ),
        Spacing.h10,
        const XText(
          '需要完成主播人脸识别',
          style: TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
        ),
      ],
    );

    child = Padding(
      padding: Pad(horizontal: 35, bottom: AppSize.safeBottom + 11),
      child: child,
    );

    return child;
  }

  Widget $PactTxt() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return OpacityButton(
                child: Image.asset(IMG.format(
                    pactRx.value ? 'shop/协议选中' : 'shop/协议未选中'),
                    width: 13, height: 13, scale: 3, fit: BoxFit.contain),
                onTap: () {
                  pactRx.toggle();
                },
              );
            }),
            Spacing.w4,
            StyledText(
              text: '我已阅读并同意<c>《<a1>直播规范</a1>》</c>',
              tags: {
                'c': StyledTextTag(
                    style: const TextStyle(color: AppPalette.primary)),
                'a1': StyledTextActionTag((val, __) =>
                    ctrl.onTapLink(val!, 'live_broadcast_specification')),
              },
              style: const TextStyle(fontSize: 12, color: AppPalette.colorA9),
            ),
          ],
        );
      },
    );
  }

  // /// 跳转选择场景
  // void selectScene() {
  //   Get.to(() => const ScenePage())?.onType<Map>((val) {
  //     sceneRx(
  //       Tuple2(val['id'], val['name']),
  //     );
  //   });
  // }

  void doStartLive() async {
    hideKeyboard();

    final title = inputs.by('房间名称');
    final notice = inputs.by('房间公告');
    final image = imageRx();
    // final scene = sceneRx();
    final freeMic = freeMicRx();
    final pact = pactRx();

    if (image == null) {
      showToast('请添加头像');
      return;
    }
    if (title.isEmpty) {
      showToast('请输入房间名称');
      return;
    }
    // if (scene == null) {
    //   showToast('请选择场景');
    //   return;
    // }
    if (pact == false) {
      showToast('请阅读并同意《直播规范》');
      return;
    }

    if(RoomManagerCtrl.ins.sceneCtrl2 != null) {
      bool changeRoom = (RoomManagerCtrl.ins.sceneCtrl2 is PersonRoomCtrl) && (RoomManagerCtrl.ins.sceneCtrl2?.roomUid == OAuthCtrl.uid);

      String msg = changeRoom ? "您正在直播中，是否下播" : '已在另一个房间，需要开启直播间吗';
      String okLabel = changeRoom ? "下播" : '开播';
      final other = await Get.simpleDialog(msg: msg, okLabel: okLabel);
      if(other != okLabel) {
        return;
      }
      await RoomManagerCtrl.ins.closeRoom2();
    }


    // 创建房间
    S_CreateScene? response = await Api.Room.open(
      title: title,
      image: image,
      notice: notice,
      // scene: scene.value1,
      freeMic: freeMic,
    );
    // 获取到roomId后跳转直播间
    int? roomId = response?.roomId.toInt();
    if (roomId == null) {
      return;
    }
    Statistic.userCreateRoom(roomId: roomId, roomName: title);
    RoomManagerCtrl.ins.needJoinRoom = false;
    Get.find<RoomManagerCtrl>().toPersonRoom(roomId: roomId, off: true);
  }
}
