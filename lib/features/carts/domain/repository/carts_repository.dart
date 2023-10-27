import '../entity/carts_entity.dart';

abstract class CartsRepository {
  Future<List<CartsEntity>> getCarts();
  Future<bool> addToCart(CartsEntity cartsEntity);
  Future<bool> deleteFromCart(int id);
  Future<void> close();
}