import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Category/domain/remote/category_remote.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getData();
}

class CategoryDataRepository extends CategoryRepository {
  final CategoryRemote _remote = Di.sl.get<CategoryRemote>();

  @override
  Future<Either<String, List<CategoryModel>>> getData() async {
    try {
      final List<CategoryModel> categoryList = await _remote.getData();
      return right(categoryList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }
}
