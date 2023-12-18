import 'package:agricu/models/product.dart';

class ProductSection {
  final String? description;
  final String? title;
  final double? discount;
  final List<Product>? products;

  const ProductSection(
      {this.description, this.title, this.discount, this.products});
}
