class CategoryEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  CategoryRatingEntity? rating;

  CategoryEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class CategoryRatingEntity {
  double? rate;
  int? count;

  CategoryRatingEntity({
    this.rate,
    this.count,
  });
}
