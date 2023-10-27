import '../model/carts_model.dart';

abstract class LocalStreetMarketDataSource {
  Future<List<CartsModel>> getCarts();
  Future<bool> addToCart(CartsModel cartsModel);
  Future<bool> deleteFromCart(int id);
  Future<void> close();
}
