import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/entity/category_entity.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/repository/category_repository.dart';

import '../../../../core/errors/failure.dart';

class GetCategoryUseCase {
  final CategoryRepository _categoryRepository;
  GetCategoryUseCase({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  Future<Either<Failed, List<CategoryEntity>>> call(String category) async =>
      await _categoryRepository.getCategory(category);
}
