import 'dart:convert';

import 'package:app_test_fiap/app/core/network/response_types/error/response.dart';
import 'package:app_test_fiap/app/core/network/response_types/error/response_impl.dart';
import 'package:app_test_fiap/app/core/network/response_types/success/success.dart';
import 'package:app_test_fiap/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_test_fiap/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';

class ProductsServiceImpl implements ProductsService {
  ProductsServiceImpl({required this.remoteDataManager});
  final RemoteDataManager remoteDataManager;
  @override
  Future<({Response result, List<ProductModel> products})> getProducts() async {
    try {
      final endpoint = Endpoint(
          method: Methods.get,
          path:
              '946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json');
      final response = await remoteDataManager.request(endpoint: endpoint);
      if (response.isSuccess) {
        final jsonResponse = jsonDecode(response.data);
        print(jsonResponse);
        final products = (jsonResponse['produtos'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return (result: Success(), products: products);
      }
      if (response.noConnection) {
        return (result: ConnectionFailure(), products: <ProductModel>[]);
      }
      return (result: GeneralFailure(), products: <ProductModel>[]);
    } catch (e) {
      return (
        result: GeneralFailure(message: e.toString()),
        products: <ProductModel>[]
      );
    }
  }
}
