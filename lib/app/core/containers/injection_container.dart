import 'package:app_test_fiap/app/core/constants/app_constants_manager.dart';
import 'package:app_test_fiap/app/core/constants/environments_enum.dart';
import 'package:app_test_fiap/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_test_fiap/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/provider/i_remote_data_provider.dart';
import 'package:app_test_fiap/app/core/remote_adapter/provider/remote_data_provider.dart';
import 'package:app_test_fiap/app/core/storage_adapter/local_database/manager/local_data_manager.dart';
import 'package:app_test_fiap/app/core/storage_adapter/secure_storage/secure_storage_adapter.dart';
import 'package:app_test_fiap/app/core/storage_adapter/secure_storage/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'DEV');
const secureStorageInstance = FlutterSecureStorage();
final getIt = GetIt.instance;
final dependency = InjectionAdapter(getIt);

Future<void> init() async {
  dependency.registerLazySingleton<SecureStorageService>(
    const SecureStorageAdapter(
      secureStorageInstance,
    ),
  );

  dependency.registerLazySingleton<ILocalDataManager>(
    LocalDataManager(),
  );

  dependency.registerLazySingleton<AppConstantsManager>(
    AppConstantsManagerImpl(
      apiBaseUrl: EnvironmentsEnumMethods.envFromString(environment).apiBaseUrl,
    ),
  );

  dependency.registerLazySingleton<IRemoteDataProvider>(
    RemoteDataProvider(
      appConstants: dependency.get<AppConstantsManager>(),
    ),
  );

  dependency.registerLazySingleton<IRemoteDataManager>(
    RemoteDataManager(
      dataProvider: dependency.get<IRemoteDataProvider>(),
    ),
  );

  // final authInjectionContainer = AuthInjectionContainer();
  // authInjectionContainer(dependency);
  //
  // final customWeatherInjectionContainer = CurrentWeatherInjectionContainer();
  // customWeatherInjectionContainer(dependency);
  //
  // final forecastWeatherInjectionContainer = ForecastWeatherInjectionContainer();
  // forecastWeatherInjectionContainer(dependency);
}
