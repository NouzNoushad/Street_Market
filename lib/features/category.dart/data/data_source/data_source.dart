import 'package:ecom_clean_architecture/features/category.dart/data/model/category_model.dart';

abstract class RemoteCategoryDataSource {
  Future<List<CategoryModel>> getCategory(String category);
}
