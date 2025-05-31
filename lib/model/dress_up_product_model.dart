import 'package:app/model/product_attribute_model.dart';
import 'package:app/model/product_label_model.dart';
import 'package:app/model/product_redemption_model.dart';
import 'package:app/model/product_sku_model.dart';

/// 装扮商品
class DressUpProductModel {
  int? id;
  int? productNo;
  int? categoryId;
  String? name;
  String? image;
  int? price;
  int? currency;
  int? status;
  int? createdAt;
  int? updatedAt;
  int? sellAt;
  int? gender;
  String? extra;
  List<int>? productPositionIdList;
  String? modelId;
  bool? initDressUp;
  List<ProductLabelModel>? labelList;
  String? stateName;
  List<ProductAttributeModel>? productAttributeList;
  bool? isBind;
  bool? isSuit;
  String? activityUrl;
  List<ProductRedemptionModel>? redemptionList;
  List<ProductSkuModel>? skuList;
  String? icon;
  String? detailImage;

  DressUpProductModel(
      {this.id,
        this.productNo,
        this.categoryId,
        this.name,
        this.image,
        this.price,
        this.currency,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.sellAt,
        this.gender,
        this.extra,
        this.productPositionIdList,
        this.modelId,
        this.initDressUp,
        this.labelList,
        this.stateName,
        this.productAttributeList,
        this.isBind,
        this.isSuit,
        this.activityUrl,
        this.redemptionList,
        this.skuList,
        this.icon,
        this.detailImage});

  DressUpProductModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    productNo = json['product_no'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    currency = json['currency'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sellAt = json['sell_at'];
    gender = json['gender'];
    extra = json['extra'];
    productPositionIdList = json['product_position_id_list'].cast<int>();
    modelId = json['model_id'];
    initDressUp = json['init_dress_up'];
    if (json['label_list'] != null) {
      labelList = <ProductLabelModel>[];
      json['label_list'].forEach((v) {
        labelList!.add(ProductLabelModel.fromJson(v));
      });
    }else{
      labelList = [];
    }
    stateName = json['state_name'];
    if (json['product_attribute_list'] != null) {
      productAttributeList = <ProductAttributeModel>[];
      json['product_attribute_list'].forEach((v) {
        productAttributeList!.add(ProductAttributeModel.fromJson(v));
      });
    }else{
      productAttributeList = [];
    }
    isBind = json['is_bind'];
    isSuit = json['is_suit'];
    activityUrl = json['activity_url'];
    if (json['redemption_list'] != null) {
      redemptionList = <ProductRedemptionModel>[];
      json['redemption_list'].forEach((v) {
        redemptionList!.add(ProductRedemptionModel.fromJson(v));
      });
    }else{
      redemptionList = [];
    }
    if (json['sku_list'] != null) {
      skuList = <ProductSkuModel>[];
      json['sku_list'].forEach((v) {
        skuList!.add(ProductSkuModel.fromJson(v));
      });
    }else{
      skuList = [];
    }
    icon = json['icon'];
    detailImage = json['detail_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_no'] = this.productNo;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sell_at'] = this.sellAt;
    data['gender'] = this.gender;
    data['extra'] = this.extra;
    data['product_position_id_list'] = this.productPositionIdList;
    data['model_id'] = this.modelId;
    data['init_dress_up'] = this.initDressUp;
    if (this.labelList != null) {
      data['label_list'] = this.labelList!.map((v) => v.toJson()).toList();
    }
    data['state_name'] = this.stateName;
    data['product_attribute_list'] = this.productAttributeList;
    data['is_bind'] = this.isBind;
    data['is_suit'] = this.isSuit;
    data['activity_url'] = this.activityUrl;
    data['redemption_list'] = this.redemptionList;
    if (this.skuList != null) {
      data['sku_list'] = this.skuList!.map((v) => v.toJson()).toList();
    }
    data['icon'] = this.icon;
    data['detail_image'] = this.detailImage;
    return data;
  }
}


