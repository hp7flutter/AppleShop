import 'package:apple_shop_ir/common/api/api_call.dart';

class CategoryModel {
  String? id;
  String? collectionId;
  String? title;
  String? color;
  String? thumbnail;
  String? icon;

  CategoryModel({
    this.id,
    this.collectionId,
    this.title,
    this.color,
    this.thumbnail,
    this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      collectionId: json['collectionId'],
      title: json['title'],
      color: json['color'],
      thumbnail: ApiCall.loadFile(json, 'thumbnail'),
      icon: ApiCall.loadFile(json, 'icon'),
    );
  }
}
