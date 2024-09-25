import 'dart:convert';

import 'package:app_test_fiap/app/core/network/response_types/error/response_impl.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_test_fiap/app/features/home/services/categories/categories_service_impl.dart';
import 'package:app_test_fiap/app/features/home/model/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements RemoteDataManager {}

void main() {
  late CategoriesServiceImpl service;
  late MockRemoteDataManager mockRemoteDataManager;

  setUp(() {
    mockRemoteDataManager = MockRemoteDataManager();
    service = CategoriesServiceImpl(remoteDataManager: mockRemoteDataManager);
  });

  setUpAll(() {
    registerFallbackValue(
      Endpoint(
        method: Methods.get,
        path: '',
      ),
    );
  });

  group('CategoriesServiceImpl', () {
    test('fetchCategories returns a list of categories', () async {
      final responsePayload = {
        "categorias": [
          {'id': 1, 'nome': 'Category 1', 'imagem': 'image1.jpg'},
          {'id': 2, 'nome': 'Category 2', 'imagem': 'image2.jpg'},
        ]
      };

      when(
        () => mockRemoteDataManager.request(endpoint: any(named: 'endpoint')),
      ).thenAnswer(
        (_) async => RemoteData(
          data: jsonEncode(responsePayload),
          statusCode: 200,
        ),
      );

      final response = await service.getCategories();

      expect(response.categories, isA<List<CategoryModel>>());
      expect(response.categories.length, 2);
      expect(response.categories[0].id, 1);
      expect(response.categories[0].nome, 'Category 1');
      expect(response.categories[0].imagem, 'image1.jpg');
    });

    test('fetchCategories handles errors correctly', () async {
      when(
        () => mockRemoteDataManager.request(endpoint: any(named: 'endpoint')),
      ).thenAnswer(
        (_) async => RemoteData(
          statusCode: 500,
        ),
      );

      final response = await service.getCategories();

      expect(response,
          isA<({GeneralFailure result, List<CategoryModel> categories})>());
    });

    test('fetchCategories handles empty response correctly', () async {
      when(
        () => mockRemoteDataManager.request(endpoint: any(named: 'endpoint')),
      ).thenAnswer(
        (_) async => RemoteData(
          data: [],
          statusCode: 200,
        ),
      );

      final response = await service.getCategories();

      expect(response.categories, isA<List<CategoryModel>>());
      expect(response.categories, isEmpty);
    });
  });
}
