class ProductDetailsEntity {
  int? id;
  String? title;
  double?price;
  String? description;
  String? category;
  String? image;
  DetailsRatingEntity? rating;

  ProductDetailsEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class DetailsRatingEntity {
  double? rate;
  int? count;

  DetailsRatingEntity({
    this.rate,
    this.count,
  });
}