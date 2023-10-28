import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/features/products/domain/repository/products_repository.dart';

import '../../../../core/errors/failure.dart';
import '../entity/products_entity.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository;

  Future<Either<Failed, List<ProductsEntity>>> call() =>
      _productsRepository.getProducts();
}
