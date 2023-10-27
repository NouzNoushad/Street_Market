import 'package:ecom_clean_architecture/core/mapper/carts_mapper.dart';
import 'package:ecom_clean_architecture/core/mapper/products_mapper.dart';
import 'package:ecom_clean_architecture/features/carts/data/model/carts_model.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/products/data/model/products_model.dart';
import 'package:ecom_clean_architecture/features/products/domain/entity/products_entity.dart';

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

extension CartsModelExt on CartsModel {
  CartsEntity get toCartsEntity => CartsMapper().toEntity(this);
}

extension CartsEntityExt on CartsEntity {
  CartsModel get fromCartsEntity => CartsMapper().formEntity(this);
}
