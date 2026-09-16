import 'package:apple_shop_ir/features/Banner/model/banner_model.dart';
import 'package:equatable/equatable.dart';

abstract class BannerState extends Equatable {
  const BannerState();
}

class BannerInitialState extends BannerState {
  @override
  List<Object?> get props => [];
}

class BannerLoadingState extends BannerState {
  @override
  List<Object?> get props => [];
}

class BannerResponseState extends BannerState {
  final List<BannerModel> response;
  const BannerResponseState(this.response);
  @override
  List<Object?> get props => [response];
}

class BannerErrorState extends BannerState {
  final String message;
  const BannerErrorState(this.message);
  @override
  List<Object?> get props => [];
}
