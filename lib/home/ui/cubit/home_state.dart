part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class GettingProducts extends HomeState {
  const GettingProducts();
}

class GettingBanners extends HomeState{
  const GettingBanners();
}

class ProductsLoaded extends HomeState {
  const ProductsLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class HomeError extends HomeState {
  const HomeError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}
