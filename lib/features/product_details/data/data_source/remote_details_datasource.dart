import 'package:ecom_clean_architecture/core/mapper/product_details_mapper.dart';
import 'package:ecom_clean_architecture/features/product_details/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/product_details/data/model/product_details_model.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/screens/product_details.dart';

import '../../../../core/data_source/api/api_consumer.dart';
import '../../../../core/data_source/api/end_points.dart';
import '../../../../core/utils/strings.dart';

class RemoteProductDetailsDataSourceImpl extends RemoteProductDetailsDataSource{
  final ApiConsumer _apiConsumer;
  RemoteProductDetailsDataSourceImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) async {
    String url = "$baseUrl/${Endpoints.products}/$productId";
    String response = await _apiConsumer.getRequest(url);
    ProductDetailsModel product = productDetailsModelFromJson(response);
    logger('details response', product);
    return product;
  }
}