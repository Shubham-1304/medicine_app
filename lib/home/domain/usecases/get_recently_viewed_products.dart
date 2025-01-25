import 'package:equatable/equatable.dart';
import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/core/usecases.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/repositories/home_repositories.dart';

class GetRecentlyViewedProducts
    extends UsecaseWithParams<List<Products>, GetRecentlyViewedProductsParams> {
  const GetRecentlyViewedProducts(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<Products>> call(GetRecentlyViewedProductsParams params) async =>
      _repository.getRecentlyViewedProducts(userId: params.userId);
}

class GetRecentlyViewedProductsParams extends Equatable {
  const GetRecentlyViewedProductsParams({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
