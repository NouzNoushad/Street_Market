import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/usecase/usecase.dart';
import 'package:ecom_clean_architecture/domain/repository/products_repository.dart';

import '../../core/errors/failure.dart';
import '../entity/products_entity.dart';

class GetProductsUseCase
    extends UseCase<Either<Failed, List<ProductsEntity>>, void> {
  final ProductsRepository _productsRepository;

  GetProductsUseCase({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository;

  @override
  Future<Either<Failed, List<ProductsEntity>>> call([void param]) =>
      _productsRepository.getProducts();
}
