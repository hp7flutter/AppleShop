import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:apple_shop_ir/features/Product/domain/remote/product_remote.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getHottest();
  Future<Either<String, List<ProductModel>>> getBestSeller();
}

class ProductDataRepository extends ProductRepository {
  final ProductRemote remote = Di.sl.get<ProductRemote>();

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final List<ProductModel> dataList = await remote.getProducts();
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBestSeller() async {
    try {
      final List<ProductModel> dataList = await remote.getBestSeller();
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getHottest() async {
    try {
      final List<ProductModel> dataList = await remote.getHotest();
      return right(dataList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }
}
