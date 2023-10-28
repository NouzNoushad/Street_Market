part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailsLoadedEvent extends ProductDetailsEvent {
  final int productId;
  const ProductDetailsLoadedEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
