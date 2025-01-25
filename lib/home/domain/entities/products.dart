import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/entities/product_skus.dart';

class Products extends Equatable {
  const Products({
    required this.productId,
    this.categoryId,
    this.styleId,
    this.brandId,
    this.detailId,
    this.groupId,
    this.productName,
    this.productDescription,
    this.productCostPrice,
    this.productSalesPrice,
    this.catalogueImage,
    this.productColors,
    this.productImages,
    this.productDetails,
    this.productSizeQuantityMap,
    this.productSizes,
    this.createdAt,
    this.updatedAt,
  });

  final String productId;
  final String? categoryId;
  final String? styleId;
  final String? brandId;
  final String? detailId;
  final String? groupId;
  final String? productName;
  final String? productDescription;
  final num? productCostPrice;
  final num? productSalesPrice;
  final String? catalogueImage;
  final String? productColors;
  final List<String>? productImages;
  final Map<String,String>? productDetails;
  final Map<String,int>? productSizeQuantityMap;
  final List<ProductSkus>? productSizes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [productId];
}
