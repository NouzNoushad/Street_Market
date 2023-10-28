import 'package:ecom_clean_architecture/core/mapper/mapper.dart';

import '../../features/product_details/data/model/product_details_model.dart';
import '../../features/product_details/domain/entity/product_details_entity.dart';

class ProductDetailsMapper extends Mapper<ProductDetailsEntity, ProductDetailsModel> {
  @override
  ProductDetailsModel formEntity(ProductDetailsEntity entity) => ProductDetailsModel(
      id: entity.id,
      image: entity.image,
      category: entity.category,
      description: entity.description,
      price: entity.price,
      rating: entity.rating,
      title: entity.title);

  @override
  ProductDetailsEntity toEntity(ProductDetailsModel model) => ProductDetailsEntity(
      id: model.id,
      image: model.image,
      category: model.category,
      description: model.description,
      price: model.price,
      rating: model.rating,
      title: model.title);
}

class DetailsRatingMapper extends Mapper<DetailsRatingEntity, DetailsRatingModel> {
  @override
  DetailsRatingModel formEntity(DetailsRatingEntity entity) => DetailsRatingModel(
        count: entity.count,
        rate: entity.rate,
      );

  @override
  DetailsRatingEntity toEntity(DetailsRatingModel model) => DetailsRatingEntity(
        count: model.count,
        rate: model.rate,
      );
}
