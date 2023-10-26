import 'package:ecom_clean_architecture/data/model/products_model.dart';

abstract class RemoteStreetMarketDataSource {
  Future<List<ProductsModel>> getProducts();
}
