import 'package:equatable/equatable.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();
}

class BannerGetDataEvent extends BannerEvent {
  @override
  List<Object?> get props => [];
}
