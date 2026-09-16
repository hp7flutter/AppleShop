import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Auth/domain/auth_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<Either<String, String>> register({
    required String username,
    required String password,
    required String passwordConfirm,
  });

  Future<Either<String, String>> login({
    required String username,
    required String password,
  });
}

class AuthDataRepository extends AuthRepository {
  final AuthRemote authRemote = Di.sl.get<AuthRemote>();
  final SharedPreferences sharedPreferences = Di.sl.get<SharedPreferences>();

  @override
  Future<Either<String, String>> register({
    required String username,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      await authRemote.register(username, password, passwordConfirm);
      return right('ثبت‌نام انجام شد');
    } on ApiException {
      return left('خطا، دوباره سعی کنید');
    }
  }

  @override
  Future<Either<String, String>> login({
    required String username,
    required String password,
  }) async {
    try {
      String token = await authRemote.login(username, password);
      if (token.isNotEmpty) {
        return right('شما وارد شدید');
      } else {
        return left('خطا در ورود');
      }
    } on ApiException {
      return left('خطا در ورود');
    } catch (ex) {
      return left('خطای ناشناخته');
    }
  }
}
