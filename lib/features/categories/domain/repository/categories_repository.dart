import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';

abstract class CategoriesRepository {
  Future<Either<Failed, List<String>>> getCategories();
}
