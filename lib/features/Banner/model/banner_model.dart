import 'package:apple_shop_ir/common/api/api_call.dart';

class BannerModel {
  String? id;
  String? collectionId;
  String? thumbnail;

  BannerModel({this.id, this.collectionId, this.thumbnail});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      collectionId: json['collectionId'],
      thumbnail: ApiCall.loadFile(json, 'thumbnail'),
    );
  }
}
