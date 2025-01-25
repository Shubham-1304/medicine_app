
import 'package:equatable/equatable.dart';

class ProductSkus extends Equatable {
  const ProductSkus({
    required this.skuId,
    required this.label,
    required this.productAvailable,
    required this.costPrice,
    required this.salesPrice,
    this.discountPercentage,
    this.discountValue,
    this.inventory
  });

  final String skuId;
  final String label;
  final bool productAvailable;
  final double costPrice;
  final double salesPrice;
  final double? discountPercentage;
  final double? discountValue;
  final int? inventory;

  @override
  List<Object> get props {
    return [
      skuId,
    ];
  }
}
