import 'package:app_test_fiap/app/core/network/response_types/error/i_response.dart';
import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/core/network/response_types/success/success.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_test_fiap/app/features/categories/model/category_model.dart';
import 'package:app_test_fiap/app/features/categories/service/categories_service.dart';

class CategoriesServiceImpl implements CategoriesService {
  CategoriesServiceImpl({required this.remoteDataManager});

  final IRemoteDataManager remoteDataManager;

  @override
  Future<({Response result, List<CategoryModel> categories})>
      getCategories() async {
    try {
      final endpoint = Endpoint(
          method: Methods.post,
          path:
              '/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json');
      final response = await remoteDataManager.request(endpoint: endpoint);
      if (response.isSuccess) {
        final categories = (response.data['categorias'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return (result: Success(), categories: categories);
      }
      if (response.noConnection) {
        return (result: ConnectionFailure(), categories: <CategoryModel>[]);
      }
      return (result: GeneralFailure(), categories: <CategoryModel>[]);
    } catch (e) {
      return (
        result: GeneralFailure(message: e.toString()),
        categories: <CategoryModel>[]
      );
    }
  }
}
