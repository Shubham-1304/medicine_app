
import 'package:medicine_app/core/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  ResultFuture<Type> call();
}