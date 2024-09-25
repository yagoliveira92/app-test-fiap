import 'package:app_test_fiap/app/features/home/model/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryModel', () {
    test('Default Constructor', () {
      final category =
          CategoryModel(id: 1, nome: 'Category 1', imagem: 'image.jpg');
      expect(category.id, 1);
      expect(category.nome, 'Category 1');
      expect(category.imagem, 'image.jpg');
    });

    test('fromJson', () {
      final json = {
        'id': 1,
        'nome': 'Category 1',
        'imagem': 'image.jpg',
      };
      final category = CategoryModel.fromJson(json);
      expect(category.id, 1);
      expect(category.nome, 'Category 1');
      expect(category.imagem, 'image.jpg');
    });

    test('toJson', () {
      final category =
          CategoryModel(id: 1, nome: 'Category 1', imagem: 'image.jpg');
      final json = category.toJson();
      expect(json['id'], 1);
      expect(json['nome'], 'Category 1');
      expect(json['imagem'], 'image.jpg');
    });

    test('Null Values', () {
      final category = CategoryModel();
      expect(category.id, isNull);
      expect(category.nome, isNull);
      expect(category.imagem, isNull);
    });

    test('fromJson with Null Values', () {
      final json = {
        'id': null,
        'nome': null,
        'imagem': null,
      };
      final category = CategoryModel.fromJson(json);
      expect(category.id, isNull);
      expect(category.nome, isNull);
      expect(category.imagem, isNull);
    });

    test('toJson with Null Values', () {
      final category = CategoryModel();
      final json = category.toJson();
      expect(json['id'], isNull);
      expect(json['nome'], isNull);
      expect(json['imagem'], isNull);
    });
  });
}
