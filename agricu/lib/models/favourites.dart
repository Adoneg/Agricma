import 'package:agricu/models/product.dart';

class Favourite {
  int? id;
  DateTime? createdAt;
  int? productId;
  String? userId;
  Product? product;
  Favourite(
      {this.createdAt, this.id, this.productId, this.product, this.userId});
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
    };
  }

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      productId: json['product_id'],
      product: Product.fromJson(json['PRODUCTS']),
      id: json['id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
