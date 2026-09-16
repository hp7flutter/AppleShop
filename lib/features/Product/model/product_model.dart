import 'package:apple_shop_ir/common/api/api_call.dart';

class ProductModel {
  final String id;
  final String collectionId;
  final String collectionName;
  final String categoryId;
  final String name;
  final String description;
  final String popularity;
  final int discountPrice;
  final int price;
  final int quantity;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.popularity,
    required this.discountPrice,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  int get realPrice => price + discountPrice;

  num get percent {
    if (discountPrice <= 0 || price == 0) return 0;
    return (discountPrice / realPrice) * 100;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      categoryId: json['category'],
      name: json['name'],
      description: json['description'],
      popularity: json['popularity'],
      discountPrice: json['discount_price'],
      price: json['price'],
      quantity: json['quantity'],
      thumbnail: ApiCall.loadFile(json, 'thumbnail'),
    );
  }
}
