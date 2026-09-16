import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitialState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoadingState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailResponseState extends DetailState {
  final List<GalleryModel>? galleryList;
  final List<ProductVariantsModel>? productVariantsList;
  final CategoryModel? productCategory;

  const DetailResponseState(
    this.galleryList,
    this.productVariantsList,
    this.productCategory,
  );

  @override
  List<Object?> get props => [galleryList, productVariantsList];
}