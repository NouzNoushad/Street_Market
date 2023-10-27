import 'package:ecom_clean_architecture/core/mapper/mapper.dart';
import 'package:ecom_clean_architecture/features/carts/data/model/carts_model.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';

class CartsMapper extends Mapper<CartsEntity, CartsModel> {
  @override
  CartsModel formEntity(CartsEntity entity) => CartsModel(
      category: entity.category,
      count: entity.count,
      title: entity.title,
      id: entity.id,
      image: entity.image,
      price: entity.price);

  @override
  CartsEntity toEntity(CartsModel model) => CartsEntity(
      category: model.category,
      count: model.count,
      title: model.title,
      id: model.id,
      image: model.image,
      price: model.price);
}
