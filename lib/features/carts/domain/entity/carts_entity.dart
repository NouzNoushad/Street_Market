class CartsEntity {
  int? id;
  String? image;
  String? title;
  String? category;
  double? price;
  int? count;

  CartsEntity(
      {this.category, this.count, this.id, this.image, this.price, this.title});
}
