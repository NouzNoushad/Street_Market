import 'package:ecom_clean_architecture/core/mapper/mapper.dart';

import '../../features/category.dart/data/model/category_model.dart';
import '../../features/category.dart/domain/entity/category_entity.dart';


class CategoryMapper extends Mapper<CategoryEntity, CategoryModel> {
  @override
  CategoryModel formEntity(CategoryEntity entity) => CategoryModel(
      id: entity.id,
      image: entity.image,
      category: entity.category,
      description: entity.description,
      price: entity.price,
      rating: entity.rating,
      title: entity.title);

  @override
  CategoryEntity toEntity(CategoryModel model) => CategoryEntity(
      id: model.id,
      image: model.image,
      category: model.category,
      description: model.description,
      price: model.price,
      rating: model.rating,
      title: model.title);
}

class CategoryRatingMapper extends Mapper<CategoryRatingEntity, CategoryRatingModel> {
  @override
  CategoryRatingModel formEntity(CategoryRatingEntity entity) => CategoryRatingModel(
        count: entity.count,
        rate: entity.rate,
      );

  @override
  CategoryRatingEntity toEntity(CategoryRatingModel model) => CategoryRatingEntity(
        count: model.count,
        rate: model.rate,
      );
}
