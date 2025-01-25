import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/usecases/get_favorite_products.dart';

part 'favorite_products_state.dart';


class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit({
    required GetFavouriteProducts getFavouriteProducts,
  })  : _getRecentlyViewedProducts = getFavouriteProducts,
        super(FavoriteProductsInitial());

  final GetFavouriteProducts _getRecentlyViewedProducts;

  Future<void> getFavoriteProducts({required String userId}) async {
    emit(const GettingFavoriteProducts());

    final result = await _getRecentlyViewedProducts(GetFavouriteProductsParams(userId: userId));

    result.fold(
        (failure) => emit(FavoriteProductError(failure.message, failure.statusCode)),
        (products) => emit(FavoriteProductsLoaded(products)));
  }
}

