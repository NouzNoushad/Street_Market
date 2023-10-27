import 'package:ecom_clean_architecture/features/carts/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/carts/data/model/carts_model.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';

class CartsRepositoryImpl extends CartsRepository {
  final LocalStreetMarketDataSource _localDataSource;
  CartsRepositoryImpl(
      {required LocalStreetMarketDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<bool> addToCart(CartsEntity cartsEntity) async =>
      await _localDataSource.addToCart(cartsEntity.fromCartsEntity);

  @override
  Future<void> close() async => await _localDataSource.close();

  @override
  Future<bool> deleteFromCart(int id) async =>
      await _localDataSource.deleteFromCart(id);

  @override
  Future<List<CartsEntity>> getCarts() async {
    List<CartsModel> cartsModel = await _localDataSource.getCarts();
    List<CartsEntity> cartsEntity =
        cartsModel.map((carts) => carts.toCartsEntity).toList();
    return cartsEntity;
  }
}
