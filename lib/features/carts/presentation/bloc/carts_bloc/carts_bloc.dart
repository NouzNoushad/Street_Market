import 'package:bloc/bloc.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/add_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/close_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/delete_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/get_carts_usecase.dart';
import 'package:equatable/equatable.dart';

part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  final GetCartsUseCase _getCartsUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;
  final CloseCartUseCase _closeCartUseCase;
  CartsBloc(
      {required GetCartsUseCase getCartsUseCase,
      required AddToCartUseCase addToCartUseCase,
      required DeleteCartUseCase deleteCartUseCase,
      required CloseCartUseCase closeCartUseCase})
      : _getCartsUseCase = getCartsUseCase,
        _addToCartUseCase = addToCartUseCase,
        _deleteCartUseCase = deleteCartUseCase,
        _closeCartUseCase = closeCartUseCase,
        super(CartsInitial()) {
    on<CartsLoadedEvent>(getCarts());
    on<AddToCartEvent>(addToCart());
    on<DeleteCartEvent>(deleteCart());
    on<CloseCartEvent>(closeCart());
  }

  EventHandler<CartsLoadedEvent, CartsState> getCarts() =>
      ((event, emit) async {
        emit(CartsLoadingState());
        try {
          List<CartsEntity> carts = await _getCartsUseCase.call();
          emit(CartsLoadedState(carts));
        } catch (error) {
          emit(CartsErrorState(error.toString()));
        }
      });

  EventHandler<AddToCartEvent, CartsState> addToCart() => ((event, emit) async {
        try {
          bool added = await _addToCartUseCase.call(event.cart);
          emit(AddToCartState(added));
        } catch (error) {
          emit(CartsErrorState(error.toString()));
        }
      });

  EventHandler<DeleteCartEvent, CartsState> deleteCart() =>
      ((event, emit) async {
        try {
          bool removed = await _deleteCartUseCase.call(event.id);
          emit(AddToCartState(removed));
        } catch (error) {
          emit(CartsErrorState(error.toString()));
        }
      });

  EventHandler<CloseCartEvent, CartsState> closeCart() => ((event, emit) async {
        try {
          await _closeCartUseCase.call();
          emit(CloseCartState());
        } catch (error) {
          emit(CartsErrorState(error.toString()));
        }
      });
}
