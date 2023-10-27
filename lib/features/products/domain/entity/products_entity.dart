class ProductsEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingEntity? rating;

  ProductsEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class RatingEntity {
  double? rate;
  int? count;

  RatingEntity({
     this.rate,
     this.count,
  });
}