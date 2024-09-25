import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/core/network/response_types/error/response_impl.dart';
import 'package:app_test_fiap/app/core/network/response_types/success/success.dart';
import 'package:app_test_fiap/app/features/home/model/category_model.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:app_test_fiap/app/features/home/services/categories/categories_service.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.categoryService,
    required this.productsService,
  }) : super(HomeInitial());

  final CategoriesService categoryService;
  final ProductsService productsService;

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final responseCategories = await categoryService.getCategories();
    final responseProducts = await productsService.getProducts();
    if (responseCategories.result is Success ||
        responseProducts.result is Success) {
      emit(HomeLoaded(
          categories: responseCategories.result is Success
              ? responseCategories.categories
              : <CategoryModel>[],
          products: responseProducts.result is Success
              ? responseProducts.products
              : <ProductModel>[]));
    } else {
      late Response error;
      if (responseCategories.result is ConnectionFailure ||
          responseProducts.result is ConnectionFailure) {
        error = ConnectionFailure();
      } else {
        error = GeneralFailure();
      }
      emit(HomeError(
        message:
            error is GeneralFailure ? error.message : 'Verifique sua conexão',
      ));
    }
  }
}
