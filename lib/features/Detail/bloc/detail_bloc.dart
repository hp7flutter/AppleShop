import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_event.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_state.dart';
import 'package:apple_shop_ir/features/Detail/domain/repository/detail_repository.dart';
import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository repository = Di.sl.get<DetailRepository>();

  DetailBloc() : super(DetailInitialState()) {
    on<DetailGetDataEvent>(onGetDataEvent);
  }

  Future<void> onGetDataEvent(
    DetailGetDataEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailLoadingState());

    final Either<String, List<GalleryModel>> galleryList = await repository
        .getGallery(event.productId);

    final Either<String, List<ProductVariantsModel>> productVariantsList =
        await repository.getProductVariants(event.productId);

    final Either<String, CategoryModel> productCategory = await repository
        .getCategory(event.categoryId);

    emit(
      DetailResponseState(
        galleryList.fold((l) => null, (r) => r),
        productVariantsList.fold((l) => null, (r) => r),
        productCategory.fold((l) => null, (r) => r),
      ),
    );
  }
}
