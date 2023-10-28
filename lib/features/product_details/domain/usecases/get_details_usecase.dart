import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/entity/product_details_entity.dart';

import '../../../../core/errors/failure.dart';
import '../repository/product_details_repository.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository _productDetailsRepository;

  GetProductDetailsUseCase(
      {required ProductDetailsRepository productDetailsRepository})
      : _productDetailsRepository = productDetailsRepository;

  Future<Either<Failed, ProductDetailsEntity>> call(int productId) =>
      _productDetailsRepository.getProductDetails(productId);
}
