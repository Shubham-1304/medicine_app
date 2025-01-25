part of 'new_products_cubit.dart';

class NewProductsState extends Equatable {
  const NewProductsState();

  @override
  List<Object> get props => [];
}

class NewProductsInitial extends NewProductsState {}

class GettingNewProducts extends NewProductsState {
  const GettingNewProducts();
}

class NewProductsLoaded extends NewProductsState {
  const NewProductsLoaded(this.products);

  final List<Products> products;

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class NewProductsError extends  NewProductsState{
  const NewProductsError(this.message, this.errorCode);

  final String message;
  final int errorCode;

  @override
  List<Object> get props => [message, errorCode];
}
