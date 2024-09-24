import 'package:app_test_fiap/app/core/constants/app_constants_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConstantsManager', () {
    late AppConstantsManager appConstantsManager;

    setUp(() {
      appConstantsManager = const AppConstantsManagerImpl(
        apiBaseUrl: 'https://api.example.com/',
      );
    });

    test('Deve retornar a URL base da API correta', () {
      expect(appConstantsManager.apiBaseUrl, 'https://api.example.com/');
    });
  });
}
