
import 'dart:convert';

import 'package:medicine_app/home/domain/entities/product_skus.dart';

class ProductSkusModel extends ProductSkus {
  const ProductSkusModel({
    required super.skuId,
    required super.label,
    required super.costPrice,
    required super.salesPrice,
    required super.productAvailable,
    required super.discountPercentage,
    required super.discountValue,
    super.inventory,
  });

  ProductSkusModel copyWith({
    String? skuId,
    String? label,
    bool? productAvailable,
    double? costPrice,
    double? salesPrice,
    double? discountPercentage,
    double? discountValue,
    int? inventory,
  }) {
    return ProductSkusModel(
      skuId: skuId ?? this.skuId,
      label: label ?? this.label,
      productAvailable: productAvailable ?? this.productAvailable,
      costPrice: costPrice ?? this.costPrice,
      salesPrice: salesPrice ?? this.salesPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountValue: discountValue ?? this.discountValue,
      inventory: inventory ?? this.inventory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'skuId': skuId,
      'label': label,
      'productAvailable': productAvailable,
      'costPrice': costPrice,
      'salesPrice': salesPrice,
      'discountPercentage': discountPercentage,
      'discountValue': discountValue,
      'inventory': inventory,
    };
  }

  factory ProductSkusModel.fromMap(Map<String, dynamic> map) {
    return ProductSkusModel(
      skuId: map['skuId'] as String,
      label: map['label'] as String,
      productAvailable: map['productAvailable'] as bool,
      costPrice: map['costPrice'] as double,
      salesPrice: map['salesPrice'] as double,
      discountPercentage: map['discountPercentage'] != null ? map['discountPercentage'] as double : null,
      discountValue: map['discountValue'] != null ? map['discountValue'] as double : null,
      inventory: map['inventory'] != null ? map['inventory'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSkusModel.fromJson(String source) => ProductSkusModel.fromMap(json.decode(source) as Map<String, dynamic>);

}
