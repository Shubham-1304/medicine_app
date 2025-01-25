import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/usecases/get_all_products.dart';


part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit({
    required GetAllProducts getAllProducts,
  })  : _getAllProducts = getAllProducts,
        super(AllProductsInitial());

  final GetAllProducts _getAllProducts;

  Future<void> getAllProducts() async {
    emit(const GettingAllProducts());

    final result = await _getAllProducts();

    result.fold(
        (failure) => emit(AllProductsError(failure.message, failure.statusCode)),
        (products) => emit(AllProductsLoaded(products)));
  }
}
