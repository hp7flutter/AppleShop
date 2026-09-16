import 'dart:io';

import 'package:apple_shop_ir/common/di/di.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class DioProvider {
  static FactoryFunc<Dio> registerDioHeader(Map<String, String>? headers) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Di.baseUrl,
        followRedirects: true,
        maxRedirects: 5,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: headers,
      ),
    );
    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
              return true;
            };
        return client;
      };
    }
    return () => dio;
  }

  static FactoryFunc<Dio> registerDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Di.baseUrl,
        followRedirects: true,
        maxRedirects: 5,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
              return true;
            };
        return client;
      };
    }
    return () => dio;
  }
}
