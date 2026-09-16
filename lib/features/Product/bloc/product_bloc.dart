import 'package:apple_shop_ir/features/Product/bloc/product_event.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_state.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Product/domain/repository/product_repository.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository = Di.sl.get<ProductRepository>();

  ProductBloc() : super(ProductInitialState()) {
    on<ProductGetDataEvent>(_onGetDataEvent);
  }

  Future<void> _onGetDataEvent(
    ProductGetDataEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());

    final Either<String, List<ProductModel>> productList =
        await _repository.getProducts();
    final Either<String, List<ProductModel>> productHottest =
        await _repository.getHottest();
    final Either<String, List<ProductModel>> productBestSeller =
        await _repository.getBestSeller();

    String? error;
    List<ProductModel>? allProducts;
    List<ProductModel>? hottest;
    List<ProductModel>? bestSeller;

    productList.fold((failure) => error = failure, (data) => allProducts = data);
    if (error != null) {
      emit(ProductErrorState(error!));
      return;
    }

    productHottest.fold((failure) => error = failure, (data) => hottest = data);
    if (error != null) {
      emit(ProductErrorState(error!));
      return;
    }

    productBestSeller.fold(
      (failure) => error = failure,
      (data) => bestSeller = data,
    );
    if (error != null) {
      emit(ProductErrorState(error!));
      return;
    }

    emit(ProductLoadedState(
      allProducts: allProducts!,
      hottest: hottest!,
      bestSeller: bestSeller!,
    ));
  }
}
