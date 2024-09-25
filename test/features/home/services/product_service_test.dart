import 'dart:convert';

import 'package:app_test_fiap/app/core/network/response_types/error/response_impl.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements RemoteDataManager {}

void main() {
  late ProductsServiceImpl service;
  late MockRemoteDataManager mockRemoteDataManager;

  setUp(() {
    mockRemoteDataManager = MockRemoteDataManager();
    service = ProductsServiceImpl(remoteDataManager: mockRemoteDataManager);
  });

  setUpAll(() {
    registerFallbackValue(
      Endpoint(
        method: Methods.get,
        path: '',
      ),
    );
  });

  group('ProductServiceImpl', () {
    test('fetchProducts returns a list of products', () async {
      final responsePayload = {
        "produtos": [
          {
            'id': 1,
            'nome': 'Product 1',
            'categoriaId': 1,
            'preço': 100.0,
            'imagem': 'image1.jpg'
          },
          {
            'id': 2,
            'nome': 'Product 2',
            'categoriaId': 1,
            'preço': 200.0,
            'imagem': 'image2.jpg'
          },
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

      final response = await service.getProducts();

      expect(response.products, isA<List<ProductModel>>());
      expect(response.products.length, 2);
      expect(response.products[0].id, 1);
      expect(response.products[0].nome, 'Product 1');
      expect(response.products[0].preco, 100.0);
      expect(response.products[0].imagem, 'image1.jpg');
    });

    test('fetchProducts handles errors correctly', () async {
      when(
        () => mockRemoteDataManager.request(endpoint: any(named: 'endpoint')),
      ).thenAnswer(
        (_) async => RemoteData(
          statusCode: 500,
        ),
      );

      final response = await service.getProducts();

      expect(response,
          isA<({GeneralFailure result, List<ProductModel> products})>());
    });

    test('fetchProducts handles empty response correctly', () async {
      when(
        () => mockRemoteDataManager.request(endpoint: any(named: 'endpoint')),
      ).thenAnswer(
        (_) async => RemoteData(
          data: [],
          statusCode: 200,
        ),
      );

      final response = await service.getProducts();

      expect(response.products, isA<List<ProductModel>>());
      expect(response.products, isEmpty);
    });
  });
}
