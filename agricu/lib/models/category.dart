class ProductCategory {
  final int? id;
  final String? name;

  ProductCategory({this.id, this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> map) {
    return ProductCategory(id: map['id'], name: map['name']);
  }

  @override
  String toString() {
    return 'ProductCategory(id:$id, name: $name)';
  }
}
