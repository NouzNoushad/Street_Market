part of 'carts_bloc.dart';

sealed class CartsEvent extends Equatable {
  const CartsEvent();

  @override
  List<Object> get props => [];
}

class CartsLoadedEvent extends CartsEvent {
  const CartsLoadedEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartsEvent {
  final CartsEntity cart;
  const AddToCartEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class DeleteCartEvent extends CartsEvent {
  final int id;
  const DeleteCartEvent(this.id);

  @override
  List<Object> get props => [id];
}

class CloseCartEvent extends CartsEvent {
  const CloseCartEvent();

  @override
  List<Object> get props => [];
}
