import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/products/domain/entity/products_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failed, List<ProductsEntity>>> getProducts();
}