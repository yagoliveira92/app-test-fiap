import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';

class Success extends Response {
  Success({this.hasConnection = true}) : super();

  @override
  final bool hasConnection;
}
