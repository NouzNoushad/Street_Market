import 'dart:convert';

import 'package:ecom_clean_architecture/core/data_source/api/api_consumer.dart';
import 'package:ecom_clean_architecture/core/data_source/api/end_points.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/features/categories/data/data_source/data_source.dart';

class RemoteCategoriesDataSourceImpl extends RemoteCategoriesDataSource {
  final ApiConsumer _apiConsumer;

  RemoteCategoriesDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<String>> getCategories() async {
    String url = '$baseUrl/${Endpoints.products}/${Endpoints.categories}';
    String response = await _apiConsumer.getRequest(url);
    List<String> categories =
        List<String>.from(json.decode(response).map((x) => x));
    logger('categories response', categories);
    return categories;
  }
}
