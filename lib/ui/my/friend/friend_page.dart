import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef ActionBuilder = Widget Function(UID uid, Map data, StateSetter setState);

class MyFriendPage extends StatefulWidget {
  final int initIndex;

  const MyFriendPage({super.key, required this.initIndex});

  @override
  State<MyFriendPage> createState() => _MyFriendPageState();
}

class _MyFriendPageState extends State<MyFriendPage> {
  final tabs = {
    '朋友': _DtaView(
      (page) => Api.UserInfo.friendUserList(page: page),
      action: _ActionView$Friend.new,
    ),
    '关注': _DtaView(
      (page) => Api.UserInfo.followUserList(page: page),
      action: _ActionView$Follow.new,
    ),
    '粉丝': _DtaView(
      (page) => Api.UserInfo.fansUserList(page: page),
      action: _ActionView$Fans.new,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initIndex,
      length: tabs.length,
      child: Scaffold(
        appBar: xAppBar(title: xAppBar$TabBar(tabs.keys)),
        body: TabBarView(
          children: tabs.values.toList(growable: false),
        ),
      ),
    );
  }
}

class _DtaView extends SimplePageView<Map> {
  final Future Function(PageNum page) api;
  final ActionBuilder? action;

  _DtaView(this.api, {this.action});

  @override
  BaseConfig get config {
    return const ListConfig(
      itemExtent: 70,
    );
  }

  @override
  Future fetchPage(PageNum page) => api(page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemBuilder(data: item, action: action);
  }
}

class _ItemBuilder extends StatefulWidget {
  final Map data;
  final ActionBuilder? action;

  const _ItemBuilder({required this.data, this.action});

  @override
  State<_ItemBuilder> createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<_ItemBuilder> {
  late final action = widget.action;
  late final data = widget.data;

  late final UID uid = data['uid'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UserInfoCtrl.use(
        uid,
        builder: (it) {
          return ListTile(
            dense: false,
            onTap: toUserPage(uid),
            leading: AvatarView(it?.avatar, blur: it?.avatarEx, size: 50, isShowOnline: false,),
            title: Text(
              it?.showName() ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            trailing: action?.let((fn) => fn(uid, data, setState)),
          );
        },
      ),
    );
  }
}

sealed class _ActionView extends StatelessWidget {
  final UID uid;
  final Map data;
  final StateSetter setState;

  const _ActionView(this.uid, this.data, this.setState);

  void doFollow(bool b, VoidCallback callback) {
    simpleSub(
      Api.UserInfo.follow(uid: uid, doFollow: b),
      callback: callback,
    );
  }
}

class _ActionView$Friend extends _ActionView {
  const _ActionView$Friend(super.uid, super.data, super.setState);

  @override
  Widget build(BuildContext context) {
    return XOutlinedBtn(
      label: '私聊',
      width: 60,
      height: 24,
      textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
      onTap: () => ChatPage.to(SingleChatCtrl.fromUid(uid)),
    );
  }
}

class _ActionView$Follow extends _ActionView {
  _ActionView$Follow(super.uid, super.data, super.setState);

  late final isFollow = data['is_follow'] != false;

  @override
  Widget build(BuildContext context) {
    return isFollow
        ? XOutlinedBtn(
            label: '已关注',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 12, color: AppPalette.primary),
            onTap: () => doFollow(false, () => setState(() => data['is_follow'] = false)),
          )
        : XTextBtn(
            label: '关注',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
            onTap: () => doFollow(true, () => setState(() => data['is_follow'] = true)),
          );
  }
}

class _ActionView$Fans extends _ActionView {
  _ActionView$Fans(super.uid, super.data, super.setState);

  late final isFollowEachOther = data['is_follow_each_other'];

  @override
  Widget build(BuildContext context) {
    return isFollowEachOther
        ? XOutlinedBtn(
            label: '互相关注',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 12, color: AppPalette.primary),
            onTap: () => doFollow(false, () => setState(() => data['is_follow_each_other'] = false)),
          )
        : XTextBtn(
            label: '回关',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
            onTap: () => doFollow(true, () => setState(() => data['is_follow_each_other'] = true)),
          );
  }
}
