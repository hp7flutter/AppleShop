import 'package:apple_shop_ir/common/utility/auth_manager.dart';
import 'package:apple_shop_ir/common/utility/dio_provider.dart';
import 'package:apple_shop_ir/features/Auth/domain/auth_remote.dart';
import 'package:apple_shop_ir/features/Auth/domain/auth_repository.dart';
import 'package:apple_shop_ir/features/Banner/domain/remote/banner_remote.dart';
import 'package:apple_shop_ir/features/Banner/domain/repository/banner_repository.dart';
import 'package:apple_shop_ir/features/Category/domain/remote/category_remote.dart';
import 'package:apple_shop_ir/features/Category/domain/repository/category_repository.dart';
import 'package:apple_shop_ir/features/Detail/domain/remote/detail_remote.dart';
import 'package:apple_shop_ir/features/Detail/domain/repository/detail_repository.dart';
import 'package:apple_shop_ir/features/Product/domain/remote/product_remote.dart';
import 'package:apple_shop_ir/features/Product/domain/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Di {
  static GetIt sl = GetIt.instance;
  static const String baseUrl = 'https://startflutter.ir/api/';

  static Future<void> setupLocator() async {
    // Shared Preferences
    if (!sl.isRegistered<SharedPreferences>()) {
      sl.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance(),
      );
    }

    // Dio
    sl.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: baseUrl)));
    // sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: baseUrl)));
    // if (!sl.isRegistered<Dio>()) {
    //   sl.registerLazySingleton<Dio>(DioProvider.registerDio());
    // }
    // if (!sl.isRegistered<Dio>(instance: 'dioHeader')) {
    //   final Map<String, String> headers = {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer ${AuthManager.getToken()}',
    //   };
    //   sl.registerLazySingleton<Dio>(
    //     instanceName: 'dioHeader',
    //     DioProvider.registerDioHeader(headers),
    //   );
    // }

    // Auth
    sl.registerFactory<AuthRemote>(() => AuthDataRemote());
    sl.registerFactory<AuthRepository>(() => AuthDataRepository());
    // Banner
    sl.registerFactory<BannerRemote>(() => BannerDataRemote());
    sl.registerFactory<BannerRepository>(() => BannerDataRepository());
    // Category
    sl.registerFactory<CategoryRemote>(() => CategoryDataRemote());
    sl.registerFactory<CategoryRepository>(() => CategoryDataRepository());
    // Product
    sl.registerFactory<ProductRemote>(() => ProductDataRemote());
    sl.registerFactory<ProductRepository>(() => ProductDataRepository());
    // Detail
    sl.registerFactory<DetailRemote>(() => DetailDataRemote());
    sl.registerFactory<DetailRepository>(() => DetailDataRepository());
  }
}
