import 'package:ecom_clean_architecture/core/data_source/database/database.dart';
import 'package:ecom_clean_architecture/core/data_source/database/db_consumer.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/features/carts/data/model/carts_model.dart';

import 'data_source.dart';

class LocalStreetMarketDataSourceImpl extends LocalStreetMarketDataSource {
  final DatabaseConsumer _databaseConsumer;
  LocalStreetMarketDataSourceImpl(
      {required DatabaseConsumer databaseConsumer})
      : _databaseConsumer = databaseConsumer;

  @override
  Future<bool> addToCart(CartsModel cartsModel) async {
    final db = await _databaseConsumer.database;
    final id = await db.insert(AppStrings.tableName, cartsModel.toJson());
    logger('add id', id);
    return true;
  }

  @override
  Future<bool> deleteFromCart(int id) async {
    final db = await _databaseConsumer.database;
    final deleteId =
        await db.delete(AppStrings.tableName, where: 'id = ?', whereArgs: [id]);
    logger('delete id', deleteId);
    return true;
  }

  @override
  Future<List<CartsModel>> getCarts() async {
    final db = await _databaseConsumer.database;
    final result = await db.query(AppStrings.tableName);
    List<CartsModel> cartsModel =
        result.map((e) => CartsModel.fromJson(e)).toList();
    logger('carts', cartsModel);
    return cartsModel;
  }

  @override
  Future<void> close() async {
    final db = await _databaseConsumer.database;
    db.close();
  }
}
