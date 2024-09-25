import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';

class NoConnectionException extends Response implements Exception {
  get message => 'Sem conexão com a internet.';
}

class UnauthorizedException extends Response implements Exception {
  get message => 'Você não tem permissão para acessar este recurso.';
}
