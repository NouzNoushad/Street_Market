import '../model/products_model.dart';

abstract class RemoteStreetMarketDataSource {
  Future<List<ProductsModel>> getProducts();
}
