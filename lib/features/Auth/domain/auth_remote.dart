import 'package:apple_shop_ir/common/api/api_call.dart';
import 'package:apple_shop_ir/common/api/api_exception.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/common/utility/auth_manager.dart';
import 'package:dio/dio.dart';

abstract class AuthRemote {
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<String> login(String username, String password);
}

class AuthDataRemote extends AuthRemote {
  final Dio dio = Di.sl.get<Dio>();

  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    final Map<String, String> data = {
      'username': username,
      'password': password,
      'passwordConfirm': passwordConfirm,
    };

    try {
      final Response<dynamic> response = await dio.post(
        ApiCall.register,
        data: data,
      );

      final String token = response.data?['token'];
      final String userId = response.data?['record']['id'];
      final String username = response.data?['record']['username'];
      AuthManager.saveToken(token);
      AuthManager.saveId(userId);
      AuthManager.saveUser(username);
      print(username);
      print(userId);
      print(token);

      if (response.statusCode == 200) {
        login(username, password);
      }
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
  Future<String> login(String username, String password) async {
    final Map<String, String> data = {
      'identity': username,
      'password': password,
    };

    try {
      final Response<dynamic> response = await dio.post(
        ApiCall.login,
        data: data,
      );
      if (response.statusCode == 200) {
        final String id = response.data?['record']['id'];
        final String token = response.data?['token'];
        AuthManager.saveId(id);
        AuthManager.saveToken(token);
        return token;
      }
      throw ApiException();
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
