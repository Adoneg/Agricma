import 'package:agricu/enums/availability_type_enum.dart';
import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/models/user.dart';
import 'package:intl/intl.dart';

class Product {
  final String? productId;

  final String? name;
  final String? image;
  final Availability? status;
  final double? stars;
  final CategoryEnum? category;
  final String? description;
  final double? price;
  final String? priceQuantityRatio;
  final String? maxPrepTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? sellerId;
  final AppUser? seller;
  //
  const Product({
    this.productId,
    this.price,
    this.description,
    this.image,
    this.category,
    this.status,
    this.name,
    this.priceQuantityRatio,
    this.createdAt,
    this.updatedAt,
    this.stars,
    this.sellerId,
    this.maxPrepTime,
    this.seller,
  });

  Map<String, dynamic> toJson() {
    return {
      'seller_id': sellerId,
      "max_prep_time": maxPrepTime,
      "price": price,
      "description": description,
      "product_name": name,
      "image": image,
      "quantity": priceQuantityRatio,
      "availability": status?.toDBString(),
      "category": category?.toDBString(),
      "updated_at": DateFormat('yyyy-MM-dd HH:mm:ss').format(
        (updatedAt ?? DateTime.now()).toUtc(),
      ),
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        seller: json['USERS'] == null ? null : AppUser.fromJson(json['USERS']),
        productId: json['id'].toString(),
        category: CategoryEnum.fromString(json['category']),
        name: json['product_name'],
        price: (json['price'] as num).toDouble(),
        image: json['image'],
        priceQuantityRatio: json['quantity'],
        status: Availability.fromString(json['availability']),
        description: json['description'],
        maxPrepTime: json['max_prep_time'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }

  @override
  String toString() {
    return 'Product(id:$productId, category:$category, name:$name, image:$image, status:$status, description:$description)';
  }
}
