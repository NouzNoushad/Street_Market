import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/features/category.dart/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/category.dart/data/model/category_model.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/entity/category_entity.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/repository/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final RemoteCategoryDataSource _categoryDataSource;
  CategoryRepositoryImpl({required RemoteCategoryDataSource categoryDataSource})
      : _categoryDataSource = categoryDataSource;

  @override
  Future<Either<Failed, List<CategoryEntity>>> getCategory(
      String category) async {
    try {
      List<CategoryModel> categoryModel =
          await _categoryDataSource.getCategory(category);
      List<CategoryEntity> categoryEntity =
          categoryModel.map((e) => e.toCategoryEntity).toList();
      return Right(categoryEntity);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
