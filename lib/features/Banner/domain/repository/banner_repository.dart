import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Banner/domain/remote/banner_remote.dart';
import 'package:apple_shop_ir/features/Banner/model/banner_model.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:dartz/dartz.dart';

abstract class BannerRepository {
  Future<Either<String, List<BannerModel>>> getData();
}

class BannerDataRepository extends BannerRepository {
  final BannerRemote _remote = Di.sl.get<BannerRemote>();

  @override
  Future<Either<String, List<BannerModel>>> getData() async {
    try {
      final List<BannerModel> bannerList = await _remote.getData();
      return right(bannerList);
    } on ApiException catch (ex) {
      return left(ex.exMessage!);
    } catch (ex) {
      return left(ApiStatus.connectToServerError);
    }
  }
}
