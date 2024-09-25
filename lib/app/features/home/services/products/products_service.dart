import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';

abstract class ProductsService {
  Future<({Response result, List<ProductModel> products})> getProducts();
}
