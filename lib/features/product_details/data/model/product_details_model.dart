import 'dart:convert';

import 'package:ecom_clean_architecture/features/product_details/domain/entity/product_details_entity.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel extends ProductDetailsEntity {
  DetailsRatingModel? ratingModel;
  ProductDetailsModel(
      {super.category,
      super.description,
      super.id,
      super.image,
      super.rating,
      super.price,
      super.title})
      : super() {
    ratingModel = super.rating?.fromDetailsRatingEntity;
  }

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: DetailsRatingModel.fromJson(json["rating"]),
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

class DetailsRatingModel extends DetailsRatingEntity {
  DetailsRatingModel({super.count, super.rate});

  factory DetailsRatingModel.fromJson(Map<String, dynamic> json) =>
      DetailsRatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
