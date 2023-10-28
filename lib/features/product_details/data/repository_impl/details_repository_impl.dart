import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/features/product_details/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/entity/product_details_entity.dart';
import '../../domain/repository/product_details_repository.dart';
import '../model/product_details_model.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final RemoteProductDetailsDataSource _detailsDataSource;
  ProductDetailsRepositoryImpl(
      {required RemoteProductDetailsDataSource detailsDataSource})
      : _detailsDataSource = detailsDataSource;

  @override
  Future<Either<Failed, ProductDetailsEntity>> getProductDetails(
      int productId) async {
    try {
      ProductDetailsModel detailsModel =
          await _detailsDataSource.getProductDetails(productId);
      ProductDetailsEntity detailsEntity = detailsModel.toDetailsEntity;
      return Right(detailsEntity);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
