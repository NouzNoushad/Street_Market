part of 'carts_bloc.dart';

sealed class CartsState extends Equatable {
  const CartsState();

  @override
  List<Object> get props => [];
}

final class CartsInitial extends CartsState {}

final class CartsLoadingState extends CartsState {}

class CartsLoadedState extends CartsState {
  final List<CartsEntity> carts;
  const CartsLoadedState(this.carts);

  @override
  List<Object> get props => [carts];
}

class AddToCartState extends CartsState {
  final bool added;
  const AddToCartState(this.added);

  @override
  List<Object> get props => [added];
}

class DeleteCartState extends CartsState {
  final bool removed;
  const DeleteCartState(this.removed);

  @override
  List<Object> get props => [removed];
}

class CloseCartState extends CartsState {}

class CartsErrorState extends CartsState {
  final String error;
  const CartsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
