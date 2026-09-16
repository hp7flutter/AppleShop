import 'package:apple_shop_ir/common/api/api_call.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Banner/model/banner_model.dart';
import 'package:dio/dio.dart';

abstract class BannerRemote {
  Future<List<BannerModel>> getData();
}

class BannerDataRemote extends BannerRemote {
  final Dio _dio = Di.sl.get<Dio>();

  @override
  Future<List<BannerModel>> getData() async {
    final String path = ApiCall.banners;

    try {
      final Response<dynamic> response = await _dio.get(path);
      final List<BannerModel> dataList = response.data['items']
          .map<BannerModel>((json) => BannerModel.fromJson(json))
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
