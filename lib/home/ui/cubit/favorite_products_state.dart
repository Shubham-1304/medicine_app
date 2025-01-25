part of 'favorite_products_cubit.dart';

class FavoriteProductsState extends Equatable {
  const FavoriteProductsState();

  @override
  List<Object> get props => [];
}

class FavoriteProductsInitial extends FavoriteProductsState {}

class GettingFavoriteProducts extends FavoriteProductsState {
  const GettingFavoriteProducts();
}

class FavoriteProductsLoaded extends FavoriteProductsState {
  const FavoriteProductsLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class FavoriteProductError extends FavoriteProductsState {
  const FavoriteProductError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}
