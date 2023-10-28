import 'dart:convert';

import 'package:ecom_clean_architecture/core/utils/extensions.dart';

import '../../domain/entity/category_entity.dart';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel extends CategoryEntity {
  CategoryRatingModel? ratingModel;
  CategoryModel(
      {super.id,
      super.image,
      super.category,
      super.description,
      super.price,
      super.rating,
      super.title})
      : super() {
    ratingModel = super.rating?.fromCategoryRatingEntity;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: CategoryRatingModel.fromJson(json["rating"]),
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

class CategoryRatingModel extends CategoryRatingEntity {
  CategoryRatingModel({super.count, super.rate});

  factory CategoryRatingModel.fromJson(Map<String, dynamic> json) => CategoryRatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
