import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitialState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryResposneState extends CategoryState {
  final List<CategoryModel> response;
  const CategoryResposneState(this.response);
  @override
  List<Object?> get props => [response];
}

class CategoryErrorState extends CategoryState {
  final String message;
  const CategoryErrorState(this.message);
  @override
  List<Object?> get props => [];
}
