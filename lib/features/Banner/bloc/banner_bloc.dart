import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_event.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_state.dart';
import 'package:apple_shop_ir/features/Banner/domain/repository/banner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository _repository = Di.sl.get<BannerRepository>();

  BannerBloc() : super(BannerInitialState()) {
    on<BannerGetDataEvent>(_onGetDataEvent);
  }

  Future<void> _onGetDataEvent(
    BannerGetDataEvent event,
    Emitter<BannerState> emit,
  ) async {
    emit(BannerLoadingState());

    final response = await _repository.getData();

    response.fold(
      (failure) => emit(BannerErrorState(failure)),
      (data) => emit(BannerResponseState(data)),
    );
  }
}
