import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AnnouncementMessageDialog extends StatelessWidget {
  const AnnouncementMessageDialog({super.key});

  //Get.dialog(const AnnouncementMessageDialog());
  //广播协议号：S_BulletinBroadcast = 5000;

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: const Pad(horizontal: 8, top: 0, bottom: 12),
      child: Stack(
        alignment: Alignment.center,
        children: $Body(),
      ),
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    child = Container(
      width: 307,
      height: 386,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('msg/公告板')), scale: 3),
      ),
      margin: const Pad(horizontal: 34),
      child: child,
    );

    child = FittedBox(
      fit: BoxFit.contain,
      // alignment: const FractionalOffset(0.5, (224 + 327 / 2) / 812),
      child: child,
    );

    return child;
  }

  List<Positioned> $Body() {
    return [
      const Positioned(
        top: 87,
        left: 20,
        right: 20,
        bottom: 52,
        child: SingleChildScrollView(
          child: Text(
            '亲爱的Homie用户:\nHomie世界即将更新啦，但直播依旧会作为重要的功能，以直播工具的形式继续运营，你可以在热播页持续收看直播内容如果你有喜欢的主播，记得及时关注TA哦~本次调整对使用直播工具、观看直播内容、直播购物车、礼物消费、账号金币余额均无影响。我们会在未来对持续对直播工具投入力度，为了更好维护直播内容的健康发展，我们将对直播的内容进行规范。11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',
            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),
          ),
        ),
      ),
      const Positioned(
        bottom: 20,
        right: 20,
        child: Text(
          'Homie团队',
          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),
        ),
      ),
    ];
  }
}
