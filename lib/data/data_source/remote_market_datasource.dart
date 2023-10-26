import 'package:ecom_clean_architecture/core/api/api_consumer.dart';
import 'package:ecom_clean_architecture/core/api/end_points.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/data/model/products_model.dart';

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
