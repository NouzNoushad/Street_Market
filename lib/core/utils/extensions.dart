import 'package:ecom_clean_architecture/core/mapper/products_mapper.dart';
import 'package:ecom_clean_architecture/data/model/products_model.dart';
import 'package:ecom_clean_architecture/domain/entity/products_entity.dart';

extension ProductsModelExt on ProductsModel {
  ProductsEntity get toEntity => ProductsMapper().toEntity(this);
}

extension ProductsEntityExt on ProductsEntity {
  ProductsModel get fromEntity => ProductsMapper().formEntity(this);
}

extension RatingModelExt on RatingModel {
  RatingEntity get toRatingEntity => RatingMapper().toEntity(this);
}

extension RatingEntityExt on RatingEntity {
  RatingModel get fromRatingEntity => RatingMapper().formEntity(this);
}
