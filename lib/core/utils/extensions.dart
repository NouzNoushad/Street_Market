import 'package:ecom_clean_architecture/core/mapper/carts_mapper.dart';
import 'package:ecom_clean_architecture/core/mapper/products_mapper.dart';
import 'package:ecom_clean_architecture/features/carts/data/model/carts_model.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/products/data/model/products_model.dart';
import 'package:ecom_clean_architecture/features/products/domain/entity/products_entity.dart';
import 'package:flutter/material.dart';

import '../../features/category.dart/data/model/category_model.dart';
import '../../features/category.dart/domain/entity/category_entity.dart';
import '../../features/product_details/data/model/product_details_model.dart';
import '../../features/product_details/domain/entity/product_details_entity.dart';
import '../mapper/category_mapper.dart';
import '../mapper/product_details_mapper.dart';

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

extension ProductDetailsModelExt on ProductDetailsModel {
  ProductDetailsEntity get toDetailsEntity =>
      ProductDetailsMapper().toEntity(this);
}

extension ProductDetailsEntityExt on ProductDetailsEntity {
  ProductDetailsModel get fromDetailsEntity =>
      ProductDetailsMapper().formEntity(this);
}

extension DetailsRatingModelExt on DetailsRatingModel {
  DetailsRatingEntity get toDetailsRatingEntity =>
      DetailsRatingMapper().toEntity(this);
}

extension DetailsRatingEntityExt on DetailsRatingEntity {
  DetailsRatingModel get fromDetailsRatingEntity =>
      DetailsRatingMapper().formEntity(this);
}

extension CategoryModelExt on CategoryModel {
  CategoryEntity get toCategoryEntity =>
      CategoryMapper().toEntity(this);
}

extension CategoryEntityExt on CategoryEntity {
  CategoryModel get fromCategoryEntity =>
      CategoryMapper().formEntity(this);
}

extension CategoryRatingModelExt on CategoryRatingModel {
  CategoryRatingEntity get toCategoryRatingEntity =>
      CategoryRatingMapper().toEntity(this);
}

extension CategoryRatingEntityExt on CategoryRatingEntity {
  CategoryRatingModel get fromCategoryRatingEntity =>
      CategoryRatingMapper().formEntity(this);
}

extension MediaQueryExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension CamelCaseExt on String {
  String toCamelCase() => this[0].toUpperCase() + substring(1).toLowerCase();
}

extension ScaffoldMessengerExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> toast(
          {required String message}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            textAlign: TextAlign.center,
          )));
}
