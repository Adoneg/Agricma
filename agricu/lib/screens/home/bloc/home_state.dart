part of 'home_bloc.dart';

class HomeState {
  final CategoryEnum? category;
  final List<ProductSection>? productSection;
  final List<Product>? products;
  final Status? status;
  const HomeState(
      {this.category, this.productSection, this.status, this.products});

  HomeState copyWith(
      {CategoryEnum? category,
      List<ProductSection>? productSection,
      List<Product>? products,
      Status? status}) {
    return HomeState(
        products: products ?? this.products,
        status: status ?? this.status,
        category: category ?? this.category,
        productSection: productSection ?? this.productSection);
  }
}
