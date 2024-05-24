import 'package:app/common/theme.dart';
import 'package:app/model/dress_up_product_model.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/product_label_model.dart';
import 'package:app/net/api.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'exchange/product_exchange_info_dialog.dart';

class ShopViewList extends SimplePageView<Map> {
  final int? categoryId;
  final ScrollController scroll;

  ShopViewList({required this.scroll, this.categoryId})
      : super(key: ValueKey(categoryId));

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

    return Api.Shop.oppositeSexProductList(
        page: page, categoryId: categoryId, gender: gender);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final DressUpProductModel model = DressUpProductModel.fromJson(item);
    return _ItemView(productModel: model);
  }
}

class _ItemView extends StatelessWidget {
  final DressUpProductModel productModel;

  const _ItemView({required this.productModel});

  @override
  Widget build(BuildContext context) {
    final productId = productModel.id ?? 0;
    final type = MoneyType.fromVal(productModel.currency ?? 0);
    Widget child = Row(
      children: [
        Expanded(
          child: TextOneLine(
            productModel.name ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Spacing.w6,
        (productModel.redemptionList != null &&
                productModel.redemptionList!.isNotEmpty)
            ? XTextBtn(
                width: 60,
                height: 24,
                label: '兑换',
                textStyle: const TextStyle(
                    fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
                color: AppPalette.primary,
                onTap: () {
                  Get.dialog(
                    ProductExchangeInfoDialog(productModel: productModel,),
                    useSafeArea: false,
                  );
                },
              )
            : GetX<ShoppingCartCtrl>(
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
                        return val < 1
                            ? it.doDel(productId)
                            : Future.value(false);
                      } else {
                        return count == 0
                            ? it.doAdd(productId)
                            : it.doUpdate(productId, val);
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
        Spacing.h6,
        Transform.translate(
          offset: const Offset(-5, 0),
          child: (productModel.redemptionList != null &&
                  productModel.redemptionList!.isNotEmpty)
              ? XRichText(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(
                          width: 1,
                          height: 24,
                        ),
                      ),
                      TextSpan(
                          text: '${productModel.redemptionList!.first.name}:',
                          style: const TextStyle(
                            color: AppPalette.c0,
                            fontSize: 12,
                          )),
                      TextSpan(
                          text:
                              '${productModel.redemptionList!.first.haveRedemptionCardCount}/${productModel.redemptionList!.first.redemptionNeedCount}',
                          style: const TextStyle(
                            color: Color(0xFFF400E6),
                            fontSize: 12,
                          )),
                    ],
                  ),
                )
              : XRichText(
                  TextSpan(
                    children: [
                      if (type != null)
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: MoneyIcon(type: type!, size: 24),
                        ),
                      TextSpan(
                        text: '${productModel.price ?? 0}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
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
      child: NetImage(productModel.image, width: 80, height: 80),
    );

    if (productModel.labelList != null && productModel.labelList!.isNotEmpty) {
      image = Stack(
        children: [
          image,
          for (var i = 0; i < productModel.labelList!.length; ++i)
            Positioned(
              left: (32 + 5.0) * i,
              child: NetImage(productModel.labelList![i].icon,
                  width: 32, height: 16, fit: BoxFit.contain),
            ),
        ],
      );
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
