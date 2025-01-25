import 'package:equatable/equatable.dart';
import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/core/usecases.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/repositories/home_repositories.dart';

class GetFavouriteProducts
    extends UsecaseWithParams<List<Products>, GetFavouriteProductsParams> {
  const GetFavouriteProducts(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<Products>> call(GetFavouriteProductsParams params) async =>
      _repository.getFavouriteProducts(userId: params.userId);
}

class GetFavouriteProductsParams extends Equatable {
  const GetFavouriteProductsParams({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
