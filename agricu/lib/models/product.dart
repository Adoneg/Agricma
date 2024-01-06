import 'package:agricu/services/base.dart';

class Product {
  final int? id;
  final String? productId;
  final String? name;
  final String? image;
  final bool? isFavourite;
  final String? status;
  final double? stars;
  final String? category;
  final String? description;
  final int? price;
  final String? priceQuantityRatio;
  final String? benefits;
  const Product(
      {this.productId,
      this.id,
      this.price,
      this.description,
      this.image,
      this.category,
      this.benefits,
      this.status,
      this.isFavourite,
      this.name,
      this.priceQuantityRatio,
      this.stars});

  Map<String, dynamic> toJson() {
    return {};
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        category: json['cat'],
        name: json['title'],
        price: json['price'],
        image: Base.BASEURL + json['image'],
        status: json['status'],
        description: json['description'],
        benefits: json['nutritive_benefits']);
  }

  @override
  String toString() {
    return 'Product(id:$id, category:$category, name:$name, image:$image, status:$status, description:$description, benefits: $benefits)';
  }
}
