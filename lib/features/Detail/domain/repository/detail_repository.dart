import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/features/Detail/domain/remote/detail_remote.dart';
import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_type_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailRepository {
  Future<Either<String, List<GalleryModel>>> getGallery(String productId);
  Future<Either<String, List<VariantsTypeModel>>> getVariantsType();
  Future<Either<String, List<VariantsModel>>> getVariants(String productId);
  Future<Either<String, List<ProductVariantsModel>>> getProductVariants(
    String productId,
  );
  Future<Either<String, CategoryModel>> getCategory(String categoryId);
}

class DetailDataRepository extends DetailRepository {
  final DetailRemote remote = Di.sl.get<DetailRemote>();

  @override
  Future<Either<String, List<GalleryModel>>> getGallery(
    String productId,
  ) async {
    try {
      final List<GalleryModel> dataList = await remote.getGallery(productId);
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, List<VariantsTypeModel>>> getVariantsType() async {
    try {
      final List<VariantsTypeModel> dataList = await remote.getVariantsType();
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, List<VariantsModel>>> getVariants(
    String productId,
  ) async {
    try {
      final List<VariantsModel> dataList = await remote.getVariants(productId);
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, List<ProductVariantsModel>>> getProductVariants(
    String productId,
  ) async {
    try {
      final List<ProductVariantsModel> dataList = await remote
          .getProductVariants(productId);
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, CategoryModel>> getCategory(String categoryId) async {
    try {
      final CategoryModel data = await remote.getProductCategory(categoryId);
      return right(data);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }
}
