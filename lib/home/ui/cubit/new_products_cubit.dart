import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/usecases/get_new_products.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit({
    required GetNewProducts getNewProducts,
  })  : _getNewProducts = getNewProducts,
        super(NewProductsInitial());

  final GetNewProducts _getNewProducts;

  Future<void> getNewProducts() async {
    emit(const GettingNewProducts());

    final result = await _getNewProducts();

    result.fold(
        (failure) => emit(NewProductsError(failure.message, failure.statusCode)),
        (products) => emit(NewProductsLoaded(products)));
  }
 
  void dispose() => emit(NewProductsInitial());
}
