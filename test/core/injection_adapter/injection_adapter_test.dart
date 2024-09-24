import 'package:app_test_fiap/app/core/injector_adapter/injection_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockGetIt extends Mock implements GetIt {}

void main() {
  late InjectionAdapter injectionAdapter;
  late MockGetIt mockGetIt;

  setUp(() {
    mockGetIt = MockGetIt();
    injectionAdapter = InjectionAdapter(mockGetIt);
  });

  group('get', () {
    test('Deve chamar get do GetIt com o tipo correto', () {
      when(() => mockGetIt.get<Object>()).thenAnswer((_) async => Object());
      injectionAdapter.get<Object>();
      verify(() => mockGetIt.get<Object>()).called(1);
    });
  });
}
