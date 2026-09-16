import 'package:apple_shop_ir/common/di/di.dart';

class ApiCall {
  static String endPoint({required String collection}) {
    return 'collections/$collection/records';
  }

  static String file(String id, String collectionId, String file) {
    const String baseUrl = Di.baseUrl;
    return '${baseUrl}files/$collectionId/$id/$file';
  }

  static String loadFile(Map<String, dynamic> json, String file) {
    const String baseUrl = Di.baseUrl;
    return '${baseUrl}files/${json['collectionId']}/${json['id']}/${json[file]}';
  }

  static String login = 'collections/users/auth-with-password/';
  static String register = endPoint(collection: 'users');
  static String banners = endPoint(collection: 'banner');
  static String categories = endPoint(collection: 'category');
  static String products = endPoint(collection: 'products');
  static String gallery = endPoint(collection: 'gallery');
  static String variants = endPoint(collection: 'variants');
  static String variantsType = endPoint(collection: 'variants_type');
}
