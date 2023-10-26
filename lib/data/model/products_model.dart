import 'dart:convert';

import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/domain/entity/products_entity.dart';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel extends ProductsEntity {
  RatingModel? ratingModel;
  ProductsModel(
      {super.id,
      super.image,
      super.category,
      super.description,
      super.price,
      super.rating,
      super.title})
      : super() {
    ratingModel = super.rating?.fromRatingEntity;
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": ratingModel?.toJson(),
      };
}

class RatingModel extends RatingEntity {
  RatingModel({super.count, super.rate});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
