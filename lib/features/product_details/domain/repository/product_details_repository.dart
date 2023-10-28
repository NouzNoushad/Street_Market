import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/product_details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failed, ProductDetailsEntity>> getProductDetails(int productId);
}
