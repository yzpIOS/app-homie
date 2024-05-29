
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:app/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///刷新加载
Widget refreshBox(onRefresh, onLoading, refController, childs,
    {isShowUp = true, reverse = false, isShowDown = true, isMain = false}) {
  return SmartRefresher(
      enablePullDown: isShowDown,
      enablePullUp: isShowUp,
      enableTwoLevel: false,
      onRefresh: onRefresh,
      onLoading: onLoading,
      controller: refController,
      reverse: reverse,
      header: isMain
          ? CustomHeader(
          builder: (BuildContext context, RefreshStatus? mode) {
            Widget? headerBody;
            headerBody = Image.asset(
              'assets/img/refresh.gif',
              width: Platform.isIOS ? 150 : 200,
              height: Platform.isIOS ? 150 : 200,
              fit: BoxFit.cover,
            );
            return Container(
                height: Platform.isIOS ? 100 : 60,
                alignment: Alignment.bottomCenter,
                // color: Get.theme.scaffoldBackgroundColor,
                child: headerBody);
          },
          height: Platform.isIOS ? 100 : 60,
          completeDuration: const Duration(milliseconds: 1200))
          : CustomHeader(
          builder: (BuildContext context, RefreshStatus? mode) {
            Widget? headerBody;
            headerBody = Image.asset(
              'assets/img/refresh.gif',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            );
            return Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                // color: Get.theme.scaffoldBackgroundColor,
                child: headerBody);
          },
          height: 60,
          completeDuration: const Duration(milliseconds: 1200)),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Container(
              width: 1,
              height: 56,
              child: Center(
                child: Text(
                  "上拉加载",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            );
          } else if (mode == LoadStatus.loading) {
            body = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                    color: Get.theme.textTheme.headline3!.color),
                SizedBox(width: 5),
                Text(
                  "加载中",
                  style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.textTheme.headline3!.color),
                )
              ],
            );
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试",
                style: TextStyle(color: Theme.of(context).primaryColor));
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!",
                style: TextStyle(color: Theme.of(context).primaryColor));
          } else {
            body = Text("没有更多数据了！",
                style: TextStyle(color: Theme.of(context).primaryColor));
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: childs);
}