import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/usecases/get_trendy_products.dart';

part 'trendy_products_state.dart';

class TrendyProductsCubit extends Cubit<TrendyProductsState> {
  TrendyProductsCubit({
    required GetTrendyProducts getTrendyProducts,
  })  : _getTrendyProducts = getTrendyProducts,
        super(TrendyProductsInitial());

  final GetTrendyProducts _getTrendyProducts;

  Future<void> getTrendyProducts() async {
    emit(const GettingTrendyProducts());

    final result = await _getTrendyProducts();

    result.fold(
        (failure) => emit(TrendyProductsError(failure.message, failure.statusCode)),
        (products) => emit(TrendyProductsLoaded(products)));
  }
}
