import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/domain/entity/products_entity.dart';
import 'package:ecom_clean_architecture/domain/repository/products_repository.dart';

import '../model/products_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final RemoteStreetMarketDataSource _remoteDataSource;
  ProductsRepositoryImpl(
      {required RemoteStreetMarketDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failed, List<ProductsEntity>>> getProducts() async {
    try {
      List<ProductsModel> productsModel = await _remoteDataSource.getProducts();
      List<ProductsEntity> products =
          productsModel.map((product) => product.toEntity).toList();
      return Right(products);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
