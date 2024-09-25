import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/features/home/model/category_model.dart';

abstract class CategoriesService {
  Future<({Response result, List<CategoryModel> categories})> getCategories();
}
