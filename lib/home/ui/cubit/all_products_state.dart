part of 'all_products_cubit.dart';

class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

class AllProductsInitial extends AllProductsState {}

class GettingAllProducts extends AllProductsState {
  const GettingAllProducts();
}

class AllProductsLoaded extends AllProductsState {
  const AllProductsLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class AllProductsError extends  AllProductsState{
  const AllProductsError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}

