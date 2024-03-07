
import 'package:app/net/api.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 违规用户列表
///
class HomeBanedUserPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeBanedUserState();
}

class _HomeBanedUserState extends State<HomeBanedUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: "用户违规公告"),
      body: Column(
        children: [
          // 标题
          _createHeader(),
          // 列表
          Expanded(child: _HomeBanedUserList()),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Container(
      width: double.infinity,
      height: 40,
      color: Color(0xFFE8E8E8),
      child: Row(
        children: [
          SizedBox(width: 12,),
          Expanded(
            flex: 1,
            child: Text(
              "昵称",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              "惩罚措施",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Text(
              "原因",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}

class _HomeBanedUserList extends SimplePageView<Map> {

  @override
  Future fetchPage(PageNum page) => Api.Common.getBannedUserList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 12,),
              Expanded(
                flex: 1,
                child: Text(
                  item["username"] ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),


              SizedBox(width: 5,),

              Expanded(
                flex: 2,
                child: Text(
                  (item["punish"] ?? ""),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              SizedBox(width: 5,),

              Expanded(
                flex: 1,
                child: Text(
                  item["banned_reason"] ?? "",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              SizedBox(width: 12,),
            ],
          ),
        ),

        Container(
          color: Color(0xFFCCCCCC).withAlpha(50),
          width: double.infinity,
          height: 1,
          margin: EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}