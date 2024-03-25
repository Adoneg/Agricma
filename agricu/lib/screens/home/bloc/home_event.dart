part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetProductsEvent extends HomeEvent {}

class OnChangedCategory extends HomeEvent {
  final CategoryEnum categoryEnum;
  OnChangedCategory({required this.categoryEnum});
}

class OnGetFavourites extends HomeEvent {}

class OnToggleFavourites extends HomeEvent {
  final Product product;
  OnToggleFavourites({required this.product});
}

class OnRemoveFavourite extends HomeEvent {
  final Favourite favourite;
  OnRemoveFavourite({required this.favourite});
}
