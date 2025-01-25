import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_app/home/domain/usecases/get_all_products.dart';
import 'package:medicine_app/home/domain/usecases/get_favorite_products.dart';
import 'package:medicine_app/home/domain/usecases/get_new_products.dart';
import 'package:medicine_app/home/domain/usecases/get_recently_viewed_products.dart';
import 'package:medicine_app/home/domain/usecases/get_trendy_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetAllProducts getAllProducts,
    required GetFavouriteProducts getFavouriteProducts,
    required GetNewProducts getNewProducts,
    required GetRecentlyViewedProducts getRecentlyViewedProducts,
    required GetTrendyProducts getTrendyProducts,
  })  : _getAllProducts = getAllProducts,
        _getFavouriteProducts = getFavouriteProducts,
        _getNewProducts = getNewProducts,
        _getRecentlyViewedProducts = getRecentlyViewedProducts,
        _getTrendyProducts = getTrendyProducts,
        super(const HomeInitial());

  final GetAllProducts _getAllProducts;
  final GetFavouriteProducts _getFavouriteProducts;
  final GetNewProducts _getNewProducts;
  final GetRecentlyViewedProducts _getRecentlyViewedProducts;
  final GetTrendyProducts _getTrendyProducts;

  Future<void> getAllProducts() async {
    emit(const GettingProducts());

    final result = await _getAllProducts();

    result.fold(
        (failure) => emit(HomeError(failure.message, failure.statusCode)),
        (products) => emit(ProductsLoaded(products)));
  }

  Future<void> getFavouriteProducts({required String userId}) async {
    emit(const GettingProducts());

    final result = await _getFavouriteProducts(GetFavouriteProductsParams(userId: userId));

    result.fold(
        (failure) => emit(HomeError(failure.message, failure.statusCode)),
        (products) => emit(ProductsLoaded(products)));
  }

  Future<void> getNewProducts() async {
    emit(const GettingProducts());

    final result = await _getNewProducts();

    result.fold(
        (failure) => emit(HomeError(failure.message, failure.statusCode)),
        (products) => emit(ProductsLoaded(products)));
  }

  Future<void> getRecentlyViewedProducts({required String userId}) async {
    emit(const GettingProducts());

    final result = await _getRecentlyViewedProducts(GetRecentlyViewedProductsParams(userId: userId));

    result.fold(
        (failure) => emit(HomeError(failure.message, failure.statusCode)),
        (products) => emit(ProductsLoaded(products)));
  }

  Future<void> getTrendyProducts() async {
    emit(const GettingProducts());

    final result = await _getTrendyProducts();

    result.fold(
        (failure) => emit(HomeError(failure.message, failure.statusCode)),
        (products) => emit(ProductsLoaded(products)));
  }

}
