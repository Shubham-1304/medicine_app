part of 'trendy_products_cubit.dart';

class TrendyProductsState extends Equatable {
  const TrendyProductsState();

  @override
  List<Object> get props => [];
}

class TrendyProductsInitial extends TrendyProductsState {}

class GettingTrendyProducts extends TrendyProductsState {
  const GettingTrendyProducts();
}

class TrendyProductsLoaded extends TrendyProductsState {
  const TrendyProductsLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class TrendyProductsError extends  TrendyProductsState{
  const TrendyProductsError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}