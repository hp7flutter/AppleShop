import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/common/api/api_call.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemote {
  Future<List<CategoryModel>> getData();
}

class CategoryDataRemote extends CategoryRemote {
  final Dio _dio = Di.sl.get<Dio>();

  @override
  Future<List<CategoryModel>> getData() async {
    final String path = ApiCall.categories;

    try {
      final Response<dynamic> response = await _dio.get(path);
      final List<CategoryModel> dataList = response.data['items']
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
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
