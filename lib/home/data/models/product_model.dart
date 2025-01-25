import 'dart:convert';

import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/home/data/models/product_skus_model.dart';
import 'package:medicine_app/home/domain/entities/products.dart';


class ProductsModel extends Products{
  const ProductsModel({
    required super.productId,
    super.categoryId,
    super.brandId,
    super.styleId,
    super.groupId,
    super.detailId,
    super.productName,
    super.productDescription,
    super.productCostPrice,
    super.productSalesPrice,
    super.catalogueImage,
    super.productColors,
    super.productImages,
    super.productDetails,
    super.productSizeQuantityMap,
    super.productSizes,
    super.createdAt,
    super.updatedAt,
  });

  ProductsModel copyWith({
    String? productId,
    String? categoryId,
    String? styleId,
    String? brandId,
    String? groupId,
    String? detailId,
    String? productName,
    String? productDescription,
    num? productCostPrice,
    num? productSalesPrice,
    String? catalogueImage,
    String? productColors,
    List<String>? productImages,
    Map<String, String>? productDetails,
    Map<String, int>? productSizeQuantityMap,
    List<ProductSkusModel>? productSizes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductsModel(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      styleId: styleId ?? this.styleId,
      brandId: brandId ?? this.brandId,
      groupId: groupId ?? this.groupId,
      detailId: detailId ?? this.detailId,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productCostPrice: productCostPrice ?? this.productCostPrice,
      productSalesPrice: productSalesPrice ?? this.productSalesPrice,
      catalogueImage: catalogueImage ?? this.catalogueImage,
      productColors: productColors ?? this.productColors,
      productImages: productImages ?? this.productImages,
      productDetails: productDetails ?? this.productDetails,
      productSizeQuantityMap:
          productSizeQuantityMap ?? this.productSizeQuantityMap,
      productSizes: productSizes ?? this.productSizes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'productId': productId,
      'categoryId': categoryId,
      'styleId': styleId,
      'brandId': brandId,
      'groupId': groupId,
      'detailId': detailId,
      'productName': productName,
      'productDescription': productDescription,
      'productCostPrice': productCostPrice,
      'productSalesPrice': productSalesPrice,
      'catalogueImage': catalogueImage,
      'productColors': productColors,
      'productImages': productImages,
      'productDetails': productDetails,
      'productSizeQuantityMap': productSizeQuantityMap,
      'productSizes': productSizes,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      productId: map['productId'] as String,
      categoryId: map['categoryId'] as String?,
      styleId: map['styleId'] as String?,
      brandId: map['brandId'] as String?,
      groupId: map['groupId'] as String?,
      detailId: map['detailId'] as String?,
      productName: map['productName'] as String?,
      productDescription: map['productDescription'] as String?,
      productCostPrice: map['productCostPrice'] as num?,
      productSalesPrice: map['productSalesPrice'] as num?,
      catalogueImage: map['catalogueImage'] as String?,
      productColors: map['productColors'] as String?,
      productImages: map['productImages'] == null
          ? null
          : List<String>.from(map['productImages']),
      productDetails: map['productDetails'] == null
          ? null
          : Map<String, String>.from(map['productDetails']),
      productSizeQuantityMap: map['productSizeQuantityMap'] == null
          ? null
          : Map<String, int>.from(map['productSizeQuantityMap']),
      productSizes: map['productSizes'] == null
          ? null
          : List.from(map['productSizes'])
              .map((e) => ProductSkusModel(
                    skuId: e['skuId'],
                    label: e['label'],
                    costPrice: double.tryParse("${e['costPrice']}") ?? 0.0,
                    salesPrice: double.tryParse("${e['salesPrice']}") ?? 0.0,
                    productAvailable: e['productAvailable'],
                    discountPercentage: double.tryParse("${e['discountPercentage']}") ?? 0.0,
                    discountValue: double.tryParse("${e['discountValue']}") ?? 0.0,
                    inventory: int.tryParse("${e['inventory']}") ?? 0,
                  ))
              .toList(),
      createdAt: map['createdAt'] as DateTime?,
      updatedAt: map['updatedAt'] as DateTime?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) {
    return ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
