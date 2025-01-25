part of 'recently_viewed_product_cubit.dart';

class RecentlyViewedProductState extends Equatable {
  const RecentlyViewedProductState();

  @override
  List<Object> get props => [];
}

class RecentlyViewedProductInitial extends RecentlyViewedProductState {}

class GettingRecentlyViewedProduct extends RecentlyViewedProductState {
  const GettingRecentlyViewedProduct();
}

class RecentlyViewedProductLoaded extends RecentlyViewedProductState {
  const RecentlyViewedProductLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class RecentlyViewedProductError extends RecentlyViewedProductState {
  const RecentlyViewedProductError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}
