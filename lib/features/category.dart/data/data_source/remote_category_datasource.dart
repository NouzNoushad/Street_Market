import 'package:ecom_clean_architecture/core/data_source/api/api_consumer.dart';
import 'package:ecom_clean_architecture/features/category.dart/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/category.dart/data/model/category_model.dart';

import '../../../../core/data_source/api/end_points.dart';
import '../../../../core/utils/strings.dart';

class RemoteCategoryDataSourceImpl extends RemoteCategoryDataSource {
  final ApiConsumer _apiConsumer;
  RemoteCategoryDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<CategoryModel>> getCategory(String category) async {
    String url =
        '$baseUrl/${Endpoints.products}/${Endpoints.category}/$category';
    String response = await _apiConsumer.getRequest(url);
    List<CategoryModel> categoryResponse = categoryModelFromJson(response);
    logger('category response', categoryResponse);
    return categoryResponse;
  }
}
