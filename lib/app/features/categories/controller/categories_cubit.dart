import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/core/network/response_types/success/success.dart';
import 'package:app_test_fiap/app/features/categories/model/category_model.dart';
import 'package:app_test_fiap/app/features/categories/service/categories_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required this.categoryService,
  }) : super(CategoriesInitial());

  final CategoriesService categoryService;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await categoryService.getCategories();
    if (response.result is Success) {
      emit(CategoriesLoaded(categories: response.categories));
    } else {
      final error = response.result as GeneralFailure;
      emit(CategoriesError(
        message: error.message,
      ));
    }
  }
}
