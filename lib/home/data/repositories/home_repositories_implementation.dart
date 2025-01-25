import 'package:dartz/dartz.dart';
import 'package:medicine_app/core/errors/exceptions.dart';
import 'package:medicine_app/core/errors/failure.dart';
import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/home/data/datasources/home_remote_datatsource.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImplementation extends HomeRepository {
  const HomeRepositoriesImplementation(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Products>> getAllProducts() async {
    try {
      final result = await _remoteDataSource.getAllProducts();
      return Right(result);
    } on APIException catch (apiException) {
      return Left(APIFailure.fromException(apiException));
    }
  }

  @override
  ResultFuture<List<Products>> getFavouriteProducts(
      {required String userId}) async {
    try {
      final result =
          await _remoteDataSource.getFavouriteProducts(userId: userId);
      return Right(result);
    } on APIException catch (apiException) {
      return Left(APIFailure.fromException(apiException));
    }
  }

  @override
  ResultFuture<List<Products>> getNewProducts() async {
    try {
      final result = await _remoteDataSource.getNewProducts();
      return Right(result);
    } on APIException catch (apiException) {
      return Left(APIFailure.fromException(apiException));
    }
  }

  @override
  ResultFuture<List<Products>> getRecentlyViewedProducts(
      {required String userId}) async {
    try {
      final result =
          await _remoteDataSource.getRecentlyViewedProducts(userId: userId);
      return Right(result);
    } on APIException catch (apiException) {
      return Left(APIFailure.fromException(apiException));
    }
  }

  @override
  ResultFuture<List<Products>> getTrendyProducts() async {
    try {
      final result = await _remoteDataSource.getTrendyProducts();
      return Right(result);
    } on APIException catch (apiException) {
      return Left(APIFailure.fromException(apiException));
    }
  }

  // @override
  // ResultFuture<List<Banners>> getAllBanners() async {
  //   try {
  //     final result = await _remoteDataSource.getAllBanners();
  //     return Right(result);
  //   } on APIException catch (apiException) {
  //     return Left(APIFailure.fromException(apiException));
  //   }
  // }

  // @override
  // ResultFuture<List<Products>> getBannerProducts({required Banners banner}) async{
  //   try {
  //     print("GET BANNER REPO");
  //     final result = await _remoteDataSource.getBannerProducts(banner: banner);
  //     return Right(result);
  //   } on APIException catch (apiException) {
  //     return Left(APIFailure.fromException(apiException));
  //   }
  // }
}
