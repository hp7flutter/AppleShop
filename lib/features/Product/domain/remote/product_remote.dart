import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:apple_shop_ir/common/api/api_call.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ProductRemote {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getHotest();
  Future<List<ProductModel>> getBestSeller();
}

class ProductDataRemote extends ProductRemote {
  final Dio _dio = Di.sl.get<Dio>();
  final String _path = ApiCall.products;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final Response<dynamic> response = await _dio.get(_path);
      final List<ProductModel> dataList = response.data['items']
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return dataList;
    } on DioException catch (ex) {
      throw ApiException(
        exCode: ex.response?.statusCode,
        exMessage: ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException();
    }
  }

  @override
  Future<List<ProductModel>> getHotest() async {
    Map<String, String> qParams = {'filter': 'popularity="Hotest"'};
    try {
      final Response<dynamic> response = await _dio.get(
        _path,
        queryParameters: qParams,
      );
      final List<ProductModel> dataList = response.data['items']
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return dataList;
    } on DioException catch (ex) {
      throw ApiException(
        exCode: ex.response?.statusCode,
        exMessage: ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException();
    }
  }

  @override
  Future<List<ProductModel>> getBestSeller() async {
    Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};
    try {
      final Response<dynamic> response = await _dio.get(
        _path,
        queryParameters: qParams,
      );
      final List<ProductModel> dataList = response.data['items']
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return dataList;
    } on DioException catch (ex) {
      throw ApiException(
        exCode: ex.response?.statusCode,
        exMessage: ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException();
    }
  }
}
