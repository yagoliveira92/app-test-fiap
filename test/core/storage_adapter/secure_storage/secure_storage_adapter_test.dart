import 'package:app_test_fiap/app/core/storage_adapter/secure_storage/secure_storage_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late SecureStorageAdapter secureAdapter;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    secureAdapter = SecureStorageAdapter(mockSecureStorage);
  });

  group('read', () {
    test('Deve retornar uma string vazia quando o valor não for encontrado',
        () async {
      when(() => mockSecureStorage.read(key: any(named: 'key')))
          .thenAnswer((_) async => null);
      final result = await secureAdapter.read('any_key');
      expect(result, '');
    });

    test('Deve retornar o valor quando encontrado', () async {
      when(() => mockSecureStorage.read(key: any(named: 'key')))
          .thenAnswer((_) async => 'any_value');
      final result = await secureAdapter.read('any_key');
      expect(result, 'any_value');
    });
  });

  group('write', () {
    test(
        'Deve chamar o método write do FlutterSecureStorage com os valores corretos',
        () async {
      when(
        () => mockSecureStorage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});
      await secureAdapter.write('any_key', 'any_value');
      verify(() => mockSecureStorage.write(key: 'any_key', value: 'any_value'))
          .called(1);
    });
  });

  group('delete', () {
    test(
        'Deve chamar o método delete do FlutterSecureStorage com a chave correta',
        () async {
      when(() => mockSecureStorage.delete(key: any(named: 'key')))
          .thenAnswer((_) async {});
      await secureAdapter.delete('any_key');
      verify(() => mockSecureStorage.delete(key: 'any_key')).called(1);
    });
  });

  group('check', () {
    test('Deve retornar true quando a chave existir', () async {
      when(() => mockSecureStorage.containsKey(key: any(named: 'key')))
          .thenAnswer((_) async => true);
      final result = await secureAdapter.check('any_key');
      expect(result, true);
    });

    test('Deve retornar false quando a chave não existir', () async {
      when(() => mockSecureStorage.containsKey(key: any(named: 'key')))
          .thenAnswer((_) async => false);
      final result = await secureAdapter.check('any_key');
      expect(result, false);
    });
  });
}
