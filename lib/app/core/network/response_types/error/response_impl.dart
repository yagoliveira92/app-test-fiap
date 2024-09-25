import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';

class ConnectionFailure extends Response {}

class GeneralFailure extends Response {
  final String message;

  GeneralFailure({message})
      : message = message ?? 'Ocorreu um erro. Tente novamente mais tarde';
}
