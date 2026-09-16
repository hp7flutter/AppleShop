import 'package:apple_shop_ir/common/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifier = ValueNotifier(null);

  static final SharedPreferences sharedPref = Di.sl.get<SharedPreferences>();

  static void saveToken(String token) async {
    sharedPref.setString('access_token', token);
  }

  static String getToken() {
    return sharedPref.getString('access_token') ?? '';
  }

  static void saveId(String id) async {
    sharedPref.setString('user_id', id);
  }

  static String getId() {
    return sharedPref.getString('user_id') ?? '';
  }

  static void saveUser(String username) async {
    sharedPref.setString('user_name', username);
  }

  static String getUser() {
    return sharedPref.getString('user_name') ?? '';
  }

  static void logout() {
    sharedPref.clear();
    authChangeNotifier.value = null;
  }

  static bool isLogedIn() {
    String token = getToken();
    return token.isNotEmpty;
  }
}
