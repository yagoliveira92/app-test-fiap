import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductModel', () {
    test('Default Constructor', () {
      final product = ProductModel(
          id: 1, nome: 'Product 1', preco: 100.0, imagem: 'imagem.jpg');
      expect(product.id, 1);
      expect(product.nome, 'Product 1');
      expect(product.preco, 100.0);
      expect(product.imagem, 'imagem.jpg');
    });

    test('fromJson', () {
      final json = {
        'id': 1,
        'nome': 'Product 1',
        'preço': 100.0,
        'imagem': 'imagem.jpg',
      };
      final product = ProductModel.fromJson(json);
      expect(product.id, 1);
      expect(product.nome, 'Product 1');
      expect(product.preco, 100.0);
      expect(product.imagem, 'imagem.jpg');
    });

    test('toJson', () {
      final product = ProductModel(
          id: 1, nome: 'Product 1', preco: 100.0, imagem: 'imagem.jpg');
      final json = product.toJson();
      expect(json['id'], 1);
      expect(json['nome'], 'Product 1');
      expect(json['preço'], 100.0);
      expect(json['imagem'], 'imagem.jpg');
    });

    test('Null Values', () {
      final product = ProductModel();
      expect(product.id, isNull);
      expect(product.nome, isNull);
      expect(product.preco, isNull);
      expect(product.imagem, isNull);
    });

    test('fromJson with Null Values', () {
      final json = {
        'id': null,
        'nome': null,
        'preço': null,
        'imagem': null,
      };
      final product = ProductModel.fromJson(json);
      expect(product.id, isNull);
      expect(product.nome, isNull);
      expect(product.preco, isNull);
      expect(product.imagem, isNull);
    });

    test('toJson with Null Values', () {
      final product = ProductModel();
      final json = product.toJson();
      expect(json['id'], isNull);
      expect(json['nome'], isNull);
      expect(json['preço'], isNull);
      expect(json['imagem'], isNull);
    });
  });
}
