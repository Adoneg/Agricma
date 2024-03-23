part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetProductsEvent extends HomeEvent {}

class OnChangedCategory extends HomeEvent {
  final CategoryEnum categoryEnum;
  OnChangedCategory({required this.categoryEnum});
}
