import 'package:ecom_clean_architecture/core/mapper/mapper.dart';
import 'package:ecom_clean_architecture/features/products/data/model/products_model.dart';

import '../../features/products/domain/entity/products_entity.dart';

class ProductsMapper extends Mapper<ProductsEntity, ProductsModel> {
  @override
  ProductsModel formEntity(ProductsEntity entity) => ProductsModel(
      id: entity.id,
      image: entity.image,
      category: entity.category,
      description: entity.description,
      price: entity.price,
      rating: entity.rating,
      title: entity.title);

  @override
  ProductsEntity toEntity(ProductsModel model) => ProductsEntity(
      id: model.id,
      image: model.image,
      category: model.category,
      description: model.description,
      price: model.price,
      rating: model.rating,
      title: model.title);
}

class RatingMapper extends Mapper<RatingEntity, RatingModel> {
  @override
  RatingModel formEntity(RatingEntity entity) => RatingModel(
        count: entity.count,
        rate: entity.rate,
      );

  @override
  RatingEntity toEntity(RatingModel model) => RatingEntity(
        count: model.count,
        rate: model.rate,
      );
}
