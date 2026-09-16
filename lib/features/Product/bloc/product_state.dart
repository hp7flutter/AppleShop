import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductResponseState<T> extends ProductState {
  final List<T> response;

  const ProductResponseState(this.response);

  @override
  List<Object?> get props => [response];
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> allProducts;
  final List<ProductModel> hottest;
  final List<ProductModel> bestSeller;

  const ProductLoadedState({
    required this.allProducts,
    required this.hottest,
    required this.bestSeller,
  });

  @override
  List<Object?> get props => [allProducts, hottest, bestSeller];
}

class ProductErrorState extends ProductState {
  final String message;
  const ProductErrorState(this.message);
  @override
  List<Object?> get props => [];
}
