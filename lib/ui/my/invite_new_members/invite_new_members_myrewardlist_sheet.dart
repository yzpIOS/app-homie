import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/model/enum/room_role_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';

class InviteNewMembersMyRewardListSheet extends StatefulWidget {
  final int listType;//1.我的奖励  2.我的邀请

  const InviteNewMembersMyRewardListSheet({super.key, required this.listType});

  @override
  State<InviteNewMembersMyRewardListSheet> createState() => _InviteNewMembersMyRewardListSheetState();
}

class _InviteNewMembersMyRewardListSheetState extends State<InviteNewMembersMyRewardListSheet> {
  late List headerCategoryList;
  late String headerTitle;

  @override
  Widget build(BuildContext context) {

    switch(widget.listType) {
      case 1://我的奖励
        headerTitle = '我的奖励';
        headerCategoryList = ['奖励名称', '奖励来源', '获得时间'];
        break;
      case 2://我的邀请
        headerTitle = '我的邀请';
        headerCategoryList = ['被邀请人', '首次注册时间', '被邀请人状态'];
        break;
    }

    Widget child = Column(
      children: [
        Spacing.h43,
        Row(
          children: [
            for (var i = 0; i < headerCategoryList.length; ++i)
              Expanded(
                child: XText(
                  headerCategoryList[i],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: AppPalette.c6, fontWeight: fw$SemiBold)
                ),
              ),
          ],
        ),
        Spacing.h4,
        Expanded(child: ActivityDataView(82),),
      ],
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
        Positioned(
          top: 0,
          child: XText(headerTitle, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$SemiBold),),
        ),
      ],
    );

    return child;
  }
}

class ActivityDataView extends SimplePageView<Map> {
  final int roomId;
  final RoomRoleType? myRole;

  ActivityDataView(this.roomId, {super.key, this.myRole});

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(bottom: AppSize.safeBottom),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Moment.recommendList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    // final uid = item['uid'];
    const role = RoomRoleType.owner;

    return _ItemView(data: item, role: role);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final RoomRoleType? role;

  const _ItemView({required this.data, required this.role});

  @override
  Widget build(BuildContext context) {
    // final uid = data['uid'];
    // final nuid = Int64(data['role_id']);

    Widget child = const SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: XText('88紫钻', maxLines: 2, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),),
          ),
          Expanded(
            child: XText('红包抽取', maxLines: 2, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),),
          ),
          Expanded(
            child: XText('2023/10/12\n10：10', maxLines: 2, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),),
          ),
        ],
      ),
    );

    // child = InkWell(
    //   child: child,
    //   onTap: () {},
    // );

    return child;
  }
}
