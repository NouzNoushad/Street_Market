import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/features/categories/domain/repository/categories_repository.dart';

import '../../../../core/errors/failure.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;
  GetCategoriesUseCase({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository;

  Future<Either<Failed, List<String>>> call() async =>
      await _categoriesRepository.getCategories();
}
