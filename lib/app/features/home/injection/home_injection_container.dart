import 'package:app_test_fiap/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/features/home/controller/home_cubit.dart';
import 'package:app_test_fiap/app/features/home/services/categories/categories_service.dart';
import 'package:app_test_fiap/app/features/home/services/categories/categories_service_impl.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service_impl.dart';

class HomeInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory<CategoriesService>(
      CategoriesServiceImpl(
          remoteDataManager: dependency.get<RemoteDataManager>()),
    );

    dependency.registerFactory<ProductsService>(
      ProductsServiceImpl(
        remoteDataManager: dependency.get<RemoteDataManager>(),
      ),
    );

    dependency.registerFactory<HomeCubit>(
      HomeCubit(
        categoryService: dependency.get<CategoriesService>(),
        productsService: dependency.get<ProductsService>(),
      ),
    );
  }
}
