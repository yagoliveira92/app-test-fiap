import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/remote_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements RemoteDataManager {}

class MockEndPoint extends Mock implements Endpoint {}

void main() {
  late MockRemoteDataManager remoteDataManager;

  setUp(() {
    remoteDataManager = MockRemoteDataManager();
    registerFallbackValue(MockEndPoint());
  });

  final tLocalData = RemoteData();
  final tEndpoint = Endpoint(method: Methods.post, path: '/app-ifood.');

  test('should return a RemoteData when call a request', () async {
    when(
      () => remoteDataManager.request(
        endpoint: any(named: 'endpoint'),
      ),
    ).thenAnswer(
      (_) async => tLocalData,
    );
    final result = await remoteDataManager.request(
      endpoint: tEndpoint,
    );
    expect(result, isA<RemoteData>());
  });
}
