import 'package:ecom_clean_architecture/core/data_source/api/api_consumer.dart';
import 'package:ecom_clean_architecture/core/data_source/api/end_points.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/features/products/data/model/products_model.dart';

import 'data_source.dart';

class RemoteStreetMarketDataSourceImpl extends RemoteStreetMarketDataSource {
  final ApiConsumer _apiConsumer;
  RemoteStreetMarketDataSourceImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;

  @override
  Future<List<ProductsModel>> getProducts() async {
    String url = "$baseUrl/${Endpoints.products}";
    String response = await _apiConsumer.getRequest(url);
    List<ProductsModel> products = productsModelFromJson(response);
    logger('response', products);
    return products;
  }
}
