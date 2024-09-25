import 'package:app_test_fiap/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/features/categories/controller/categories_cubit.dart';
import 'package:app_test_fiap/app/features/categories/service/categories_service.dart';
import 'package:app_test_fiap/app/features/categories/service/categories_service_impl.dart';

class CategoriesInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory<CategoriesService>(
      CategoriesServiceImpl(
          remoteDataManager: dependency.get<RemoteDataManager>()),
    );

    dependency.registerFactory<CategoriesCubit>(
      CategoriesCubit(
        categoryService: dependency.get<CategoriesService>(),
      ),
    );
  }
}
