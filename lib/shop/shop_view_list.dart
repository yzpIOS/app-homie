import 'package:app/model/enum/gender_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ShopViewList extends SimplePageView<Map> {
  final int? categoryId;
  final ScrollController scroll;

  ShopViewList({required this.scroll, this.categoryId}) : super(key: ValueKey(categoryId));

  late final myInfo = Get.find<MyInfoCtrl>().dataRx;

  @override
  BaseConfig get config {
    return ListConfig(
      scroll: scroll,
      physics: const NeverScrollableScrollPhysics(),
      padding: const Pad(bottom: 90),
      divider: const Divider(indent: 15, endIndent: 10),
    );
  }

  @override
  Future fetchPage(PageNum page) {
    GenderEnum? gender;

    switch (myInfo().gender) {
      case GenderEnum.male:
        gender = GenderEnum.female;
        break;
      case GenderEnum.female:
        gender = GenderEnum.male;
        break;
      default:
        assert(false, '数据错误 -> $myInfo');
    }

    return Api.Shop.productList(page: page, categoryId: categoryId, gender: gender);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(data: item);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  _ItemView({required this.data});

  late final productId = data['id'];
  late final type = MoneyType.fromVal(data['currency']);

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Expanded(
          child: TextOneLine(
            data['name'],
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Spacing.w6,
        GetX<ShoppingCartCtrl>(
          builder: (it) {
            final item = it.findOneById(productId);
            final count = item?['count'] ?? 0;

            return NumberSettingView(
              key: ValueKey(Tuple2(productId, count)),
              initValue: count,
              size: 24,
              btnBG: const Color(0xFFF5F5F5),
              textColor: Colors.black,
              doChange: (val, b) {
                if (b) {
                  return val < 1 ? it.doDel(productId) : Future.value(false);
                } else {
                  return count == 0 ? it.doAdd(productId) : it.doUpdate(productId, val);
                }
              },
            );
          },
        ),
      ],
    );

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacing.h4,
        child,
        // Spacing.h4,
        // const XText(
        //   '',
        //   style: TextStyle(fontSize: 10, color: AppPalette.c9),
        // ),
        Spacing.h6,
        Transform.translate(
          offset: const Offset(-5, 0),
          child: XRichText(
            TextSpan(
              children: [
                if (type != null)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: MoneyIcon(type: type!, size: 24),
                  ),
                TextSpan(
                  text: '${data['price']}',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    Widget image = XFrameWidget(
      width: 80,
      height: 80,
      child: NetImage(data['image'], width: 80, height: 80),
    );

    if (data case {'label_list': List items}) {
      if (items.isNotEmpty) {
        image = Stack(
          children: [
            image,
            for (var i = 0; i < items.length; ++i)
              Positioned(
                left: (32 + 5.0) * i,
                child: NetImage(items[i]['icon'], width: 32, height: 16, fit: BoxFit.contain),
              ),
          ],
        );
      }
    }

    image = BlankImgState(child: image);

    child = Row(
      children: [
        image,
        Spacing.w10,
        Expanded(child: child),
      ],
    );

    child = Box(
      height: 100,
      padding: const Pad(left: 15, right: 10),
      child: child,
    );

    return child;
  }
}
