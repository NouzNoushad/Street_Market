import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';

import 'dart:convert';

CartsModel cartsModelFromJson(String str) =>
    CartsModel.fromJson(json.decode(str));

String cartsModelToJson(CartsModel data) => json.encode(data.toJson());

class CartsModel extends CartsEntity {
  CartsModel(
      {super.category,
      super.count,
      super.id,
      super.image,
      super.price,
      super.title});

    factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "category": category,
        "price": price,
        "count": count,
      };
}
