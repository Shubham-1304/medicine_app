import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/core/usecases.dart';
import 'package:medicine_app/home/domain/entities/products.dart';
import 'package:medicine_app/home/domain/repositories/home_repositories.dart';

class GetAllProducts extends UsecaseWithoutParams<List<Products>>{
  const GetAllProducts(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<Products>> call() async => _repository.getAllProducts();

}