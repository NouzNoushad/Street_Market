import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/categories/data/data_source/data_source.dart';

import '../../domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final RemoteCategoriesDataSource _categoriesDataSource;
  CategoriesRepositoryImpl(
      {required RemoteCategoriesDataSource categoriesDataSource})
      : _categoriesDataSource = categoriesDataSource;

  @override
  Future<Either<Failed, List<String>>> getCategories() async {
    try {
      List<String> categories = await _categoriesDataSource.getCategories();
      return Right(categories);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
