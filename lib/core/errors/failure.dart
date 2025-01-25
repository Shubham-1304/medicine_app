import 'package:equatable/equatable.dart';
import 'package:medicine_app/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage=> '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromException(APIException apiException)
      : this(
          message: apiException.message,
          statusCode: apiException.statusCode,
        );
}
