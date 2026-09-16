import 'package:apple_shop_ir/common/api/api_call.dart';

class GalleryModel {
  String? imageUrl;
  String? productId;

  GalleryModel(this.imageUrl, this.productId);

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(ApiCall.loadFile(json, 'image'), json['product_id']);
  }
}
