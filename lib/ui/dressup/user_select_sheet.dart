import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserSelectSheet extends ISheetWidget {
  UserSelectSheet._();

  static Future<UID?> show() => XBottomSheet.show(child: UserSelectSheet._(), maxHeight: 480);

  late final selectRx = Rxn<UID>();
  late final keywordRx = RxnString();

  @override
  late final Widget title = $SearchView();

  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ConfigList(
            config: const GridConfig(
              padding: Pad(horizontal: 20, top: 10, bottom: 10),
              gridDelegate: XGridDelegate(
                crossAxisCount: 5,
                fixedHeight: 20,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
            ),
            child: Obx(() {
              final keyword = keywordRx();

              return keyword == null || keyword.isEmpty
                  ? $BlankView()
                  : _DataView(keyword: keyword, selectRx: selectRx);
            }),
          ),
        ),
        $Btn(),
      ],
    );
  }

  Widget $Btn() {
    return Padding(
      padding: const Pad(vertical: 26),
      child: FractionallySizedBox(
        widthFactor: 120 / 375,
        child: Obx(() {
          final uid = selectRx();

          return XTextBtn(
            label: '确定',
            height: 34,
            textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
            onTap: () {
              if (uid == null) {
                showToast('请选择用户');
              } else {
                Get.back(result: uid);
              }
            },
          );
        }),
      ),
    );
  }

  Widget $SearchView() {
    return Box(
      padding: const Pad(horizontal: 20, bottom: 10),
      child: XInputView(
        height: 32,
        hintText: '请输入关键字',
        textInputAction: TextInputAction.search,
        onSubmitted: keywordRx,
      ),
    );
  }

  Widget $BlankView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: Pad(left: 20, vertical: 10),
          child: Text(
            '好友',
            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
          ),
        ),
        Expanded(child: _FriendView(selectRx: selectRx)),
      ],
    );
  }
}

class _FriendView extends SimplePageView<Map> {
  final Rxn<UID> selectRx;

  _FriendView({required this.selectRx});

  @override
  Future fetchPage(PageNum page) {
    return Api.UserInfo.friendUserList(page: page);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(uid: item['uid'], selectRx: selectRx);
  }
}

class _DataView extends SimpleDataView<Map> {
  final String keyword;
  final Rxn<UID> selectRx;

  _DataView({required this.keyword, required this.selectRx}) : super(key: ValueKey(keyword));

  @override
  Future fetch() {
    return Api.UserInfo.search(page: const PageNum(), keyword: keyword);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(uid: item['uid'], selectRx: selectRx);
  }
}

class _ItemView extends StatelessWidget {
  final UID uid;
  final Rxn<UID> selectRx;

  const _ItemView({required this.uid, required this.selectRx});

  @override
  Widget build(BuildContext context) {
    Widget child = UserInfoCtrl.use(
      uid,
      builder: (it) {
        Widget child = AvatarView(
          it?.avatar,
          blur: it?.avatarEx,
          avatarFrameUrl: it?.avatar_frame,
          side: selectRx() == uid ? const BorderSide(width: 2, color: AppPalette.primary) : BorderSide.none,
        );

        child = Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(aspectRatio: 1, child: child),
            XText(
              it?.showName() ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        );

        return child;
      },
    );

    child = OpacityButton(
      onTap: () => selectRx(uid),
      child: child,
    );

    return child;
  }
}
