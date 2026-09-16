import 'package:apple_shop_ir/common/api/api_call.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_type_model.dart';
import 'package:dio/dio.dart';

abstract class DetailRemote {
  Future<List<GalleryModel>> getGallery(String productId);
  Future<List<VariantsTypeModel>> getVariantsType();
  Future<List<VariantsModel>> getVariants(String productId);
  Future<List<ProductVariantsModel>> getProductVariants(String productId);
  Future<CategoryModel> getProductCategory(String categoryId);
}

class DetailDataRemote extends DetailRemote {
  final Dio dio = Di.sl.get<Dio>();

  @override
  Future<List<GalleryModel>> getGallery(String productId) async {
    final String path = ApiCall.gallery;
    final Map<String, String> qParams = {'filter': 'product_id="$productId"'};
    try {
      final Response<dynamic> response = await dio.get(
        path,
        queryParameters: qParams,
      );
      final List<GalleryModel> dataList = response.data['items']
          .map<GalleryModel>((json) => GalleryModel.fromJson(json))
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
  Future<List<VariantsTypeModel>> getVariantsType() async {
    final String path = ApiCall.variantsType;
    try {
      final Response<dynamic> response = await dio.get(path);
      final List<VariantsTypeModel> dataList = response.data['items']
          .map<VariantsTypeModel>((json) => VariantsTypeModel.fromJson(json))
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
  Future<List<VariantsModel>> getVariants(String productId) async {
    final String path = ApiCall.variants;
    try {
      final Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      final Response<dynamic> response = await dio.get(
        path,
        queryParameters: qParams,
      );
      final List<VariantsModel> dataList = response.data['items']
          .map<VariantsModel>((json) => VariantsModel.fromJson(json))
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
  Future<List<ProductVariantsModel>> getProductVariants(
    String productId,
  ) async {
    final List<VariantsTypeModel> variantsTypeList = await getVariantsType();
    final List<VariantsModel> variantsList = await getVariants(productId);

    final List<ProductVariantsModel> productVariantsList = [];

    for (var variantType in variantsTypeList) {
      var variantList = variantsList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantsList.add(ProductVariantsModel(variantType, variantList));
    }
    return productVariantsList;
  }

  @override
  Future<CategoryModel> getProductCategory(String categoryId) async {
    final String path = ApiCall.categories;
    try {
      final Map<String, String> qParams = {'filter': 'id="$categoryId"'};
      final Response<dynamic> response = await dio.get(
        path,
        queryParameters: qParams,
      );

      return CategoryModel.fromJson(response.data['items'][0]);
    } on DioException catch (ex) {
      throw ApiException(
        exCode: ex.response?.statusCode,
        exMessage: ex.response?.statusMessage ?? ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException();
    }
  }
}
