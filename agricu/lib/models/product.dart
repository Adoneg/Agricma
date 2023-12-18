class Product {
  final String? productId;
  final String? name;
  final String? image;
  final bool? isFavourite;
  final double? stars;
  final String? priceQuantityRatio;
  const Product(
      {this.productId,
      this.image,
      this.isFavourite,
      this.name,
      this.priceQuantityRatio,
      this.stars});

  Map<String, dynamic> toJson() {
    return {};
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product();
  }
}
