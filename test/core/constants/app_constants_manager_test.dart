import 'package:weather_app/app/core/constants/app_constants_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConstantsManager', () {
    late AppConstantsManager appConstantsManager;

    setUp(() {
      appConstantsManager = const AppConstantsManager(
        apiBaseUrl: 'https://api.example.com/',
        apiKey: 'YOUR_API_KEY',
      );
    });

    test('Deve retornar a URL base da API correta', () {
      expect(appConstantsManager.apiBaseUrl, 'https://api.example.com/');
    });

    test('Deve retornar a chave da API correta', () {
      expect(appConstantsManager.apiKey, 'YOUR_API_KEY');
    });
  });
}
