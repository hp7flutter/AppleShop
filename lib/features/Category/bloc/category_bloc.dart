import 'package:apple_shop_ir/features/Category/domain/repository/category_repository.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_event.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_state.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository = Di.sl.get<CategoryRepository>();

  CategoryBloc() : super(CategoryInitialState()) {
    on<CategoryGetDataEvent>(_onGetDataEvent);
  }

  Future<void> _onGetDataEvent(
    CategoryGetDataEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoadingState());

    final response = await _repository.getData();

    response.fold(
      (failure) => emit(CategoryErrorState(failure)),
      (data) => emit(CategoryResposneState(data)),
    );
  }
}
