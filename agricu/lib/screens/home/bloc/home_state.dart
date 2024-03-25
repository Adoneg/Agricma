part of 'home_bloc.dart';

class HomeState {
  final CategoryEnum? category;
  final List<ProductSection>? productSection;
  final List<Product>? products;
  final Status? status;
  final List<Favourite> favourites;
  const HomeState({
    this.category,
    this.productSection,
    this.status,
    this.products,
    this.favourites = const [],
  });

  HomeState copyWith(
      {CategoryEnum? category,
      List<ProductSection>? productSection,
      List<Product>? products,
      Status? status,
      List<Favourite>? favourites}) {
    return HomeState(
        products: products ?? this.products,
        status: status ?? this.status,
        category: category ?? this.category,
        productSection: productSection ?? this.productSection,
        favourites: favourites ?? this.favourites);
  }
}
