part of 'home_bloc.dart';

class HomeState {
  final CategoryEnum? category;
  final List<ProductSection>? productSection;

  const HomeState({this.category, this.productSection});

  HomeState copyWith(
      {CategoryEnum? category, List<ProductSection>? productSection}) {
    return HomeState(
        category: category ?? this.category,
        productSection: productSection ?? this.productSection);
  }
}
