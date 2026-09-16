import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';

class ProductGalleryModel {
  final List<ProductModel> product;
  final List<GalleryModel> gallery;

  ProductGalleryModel({required this.product, required this.gallery});
}

