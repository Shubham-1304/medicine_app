import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/usecases/get_recently_viewed_products.dart';

part 'recently_viewed_product_state.dart';

class RecentlyViewedProductCubit extends Cubit<RecentlyViewedProductState> {
  RecentlyViewedProductCubit({
    required GetRecentlyViewedProducts getRecentlyViewedProducts,
  })  : _getRecentlyViewedProducts = getRecentlyViewedProducts,
        super(RecentlyViewedProductInitial());

  final GetRecentlyViewedProducts _getRecentlyViewedProducts;

  Future<void> getRecentlyViewedProducts({required String userId}) async {
    emit(const GettingRecentlyViewedProduct());

    final result = await _getRecentlyViewedProducts(GetRecentlyViewedProductsParams(userId: userId));

    result.fold(
        (failure) => emit(RecentlyViewedProductError(failure.message, failure.statusCode)),
        (products) => emit(RecentlyViewedProductLoaded(products)));
  }
}
