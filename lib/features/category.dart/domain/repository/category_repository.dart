import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failed, List<CategoryEntity>>> getCategory(String category);
}
