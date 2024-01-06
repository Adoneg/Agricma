part of 'home_bloc.dart';

class HomeState {
  final CategoryEnum? category;
  final List<ProductSection>? productSection;
  final Status? status;
  const HomeState({this.category, this.productSection, this.status});

  HomeState copyWith(
      {CategoryEnum? category,
      List<ProductSection>? productSection,
      Status? status}) {
    return HomeState(
        status: status ?? this.status,
        category: category ?? this.category,
        productSection: productSection ?? this.productSection);
  }
}
