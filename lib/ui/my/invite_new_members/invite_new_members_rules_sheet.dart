import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class InviteNewMembersRulesSheet extends StatelessWidget {
  const InviteNewMembersRulesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular);

    Widget child = SingleChildScrollView(
      padding: Pad(horizontal: 31, top: 44, bottom: AppSize.safeBottom),
      child: const Column(
        children: [
          Text('1.每次成功邀请1个新用户，即可获得1次抽取红包的机会；红包内必定包含紫钻，最高可得999紫钻', style: textStyle,),
          Spacing.h10,
          Text('2.受邀用户必须是没有注册且未登陆过Homie世界的新用户，同一手机号，设备，实名认证视为同一用户；完成邀请后新用户需要下载并登录Homie世界才算成功邀请', style: textStyle,),
          Spacing.h10,
          Text('3.严禁使用缺陷或非正常手段参与活动，一经发现，取消参与资格，并有权回收已获得的奖励', style: textStyle,),
          Spacing.h10,
          Text('4.所有活动奖励均为系统发放，如遇奖励没有到账或奖励失效请联系客服处理', style: textStyle,),
          Spacing.h10,
          Text('5.Homie世界运营团队保留对活动规则进行修改和解释的权利，此活动和苹果公司无关', style: textStyle,),
        ],
      ),
    );

    child = Container(
      margin: const Pad(top: 10, left: 10, right: 10),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      ),
      child: child,
    );

    child = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            height: AppSize.safeBottom + 368,
            decoration: const ShapeDecoration(
              shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF5449), Color(0xFFFF0E51)],
              ),
            ),
            child: child
        ),
        Positioned(
          top: -6,
          child: Image.asset(IMG.format('my/invite_new_members_sheet_header'), scale: 3),
        ),
        const Positioned(
          top: 0,
          child: XText('活动规则', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$SemiBold),),
        ),
      ],
    );

    return child;
  }
}
