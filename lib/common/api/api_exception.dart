import 'package:apple_shop_ir/common/api/api_status.dart';

class ApiException implements Exception {
  int? exCode;
  String? exMessage;

  ApiException({this.exCode = 0, this.exMessage = ApiStatus.connectToServerError});
}
