import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class DetailGetDataEvent extends DetailEvent {
  final String productId;
  final String categoryId;

  const DetailGetDataEvent({required this.productId, required this.categoryId});

  @override
  List<Object?> get props => [productId];
}
