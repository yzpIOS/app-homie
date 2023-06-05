import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/conv_view.dart';
import 'package:app/ui/message/interactive_page.dart';
import 'package:app/ui/my/friend/access_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with BusStateMixin {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    on<ConvRefreshEvent>((_) => refreshKey.currentState?.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '消息'),
      body: Column(
        children: [
          const Box(
            height: 120,
            child: _ActionView(),
          ),
          Expanded(
            child: ConvView(refreshKey),
          ),
        ],
      ),
    );
  }
}

class _ActionView extends GetView<ConvManagerCtrl> {
  const _ActionView();

  @override
  Widget build(BuildContext context) {
    const data = [SysConvEnum.like, SysConvEnum.at, SysConvEnum.guest];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final item in data) itemBuilder(item),
      ],
    );
  }

  Widget itemBuilder(SysConvEnum type) {
    return OpacityButton(
      onTap: () => onItemClick(type),
      child: SizedBox(
        width: 90,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              final count = controller.sysBadgeRx[type]?.value2 ?? 0;

              return AppBadge.count(
                count: count,
                position: BadgePosition.topEnd(top: 0, end: 0),
                child: Image.asset(IMG.$('msg/${type.label}'), scale: 3),
              );
            }),
            XText(
              type.label,
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
            ),
          ],
        ),
      ),
    );
  }

  void onItemClick(SysConvEnum action) {
    switch (action) {
      case SysConvEnum.like:
      case SysConvEnum.at:
        Get.to(() => InteractivePage(type: action));
        break;
      case SysConvEnum.guest:
        Get.to(() => const AccessPage());
        break;
      case SysConvEnum.follow:
      case SysConvEnum.news:
      case SysConvEnum.notice:
      case SysConvEnum.dressUp:
      case SysConvEnum.gift:
        assert(false, '数据错误');
        break;
    }
  }
}
