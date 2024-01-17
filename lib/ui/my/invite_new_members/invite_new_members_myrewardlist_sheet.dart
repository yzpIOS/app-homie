import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/model/enum/room_role_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:intl/intl.dart';

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
        Spacing.h12,
        Expanded(child: ActivityDataView(82, widget.listType),),
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
          margin: EdgeInsets.symmetric(horizontal: 5),
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
          top: 10,
          child: Image.asset(IMG.format('my/invite_new_members_sheet_header'), scale: 3),
        ),
        Positioned(
          top: 15,
          child: XText(headerTitle, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$SemiBold),),
        ),
      ],
    );

    return child;
  }
}

class ActivityDataView extends SimplePageView<Map> {
  final int listType;
  final int roomId;
  final RoomRoleType? myRole;

  ActivityDataView(this.roomId, this.listType, {super.key, this.myRole});

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(bottom: AppSize.safeBottom),
    );
  }

  @override
  Future fetchPage(PageNum page) {
    if(listType == 1) {
      return Api.Activity.prizeList(page: page);
    } else {
      return Api.Activity.inviteList(page: page);
    }
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    // final uid = item['uid'];
    const role = RoomRoleType.owner;

    return _ItemView(data: item, role: role, listType: listType,);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final int listType;
  final RoomRoleType? role;

  const _ItemView({required this.data, required this.role, required this.listType});

  @override
  Widget build(BuildContext context) {
    // final uid = data['uid'];
    // final nuid = Int64(data['role_id']);
    TextStyle textStyle = const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Regular);
    String value1 = listType == 1 ? data["prize_name"] : data["invite_name"];
    String value2 = listType == 1 ? data["prize_source"] : DateFormat("yyyy/MM/dd/hh:mm").formatEpoch(data["register_at"]);
    String value3 = listType == 1 ? DateFormat("yyyy/MM/dd/hh:mm").formatEpoch(data["acquire_at"]) : data["invite_status"];

    Widget child = SizedBox(
      height: 50,
      child: Column(
        children: [
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            color: Color(0xFFE3E7ED),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: XText(value1, maxLines: 2, textAlign: TextAlign.center, style: textStyle,),
                ),
                Expanded(
                  child: XText(value2, maxLines: 2, textAlign: TextAlign.center, style: textStyle,),
                ),
                Expanded(
                  child: XText(value3, maxLines: 2, textAlign: TextAlign.center, style: textStyle,),
                ),
              ],
            ),
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
