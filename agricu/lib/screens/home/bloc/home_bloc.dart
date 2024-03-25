import 'dart:developer';

import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/models/favourites.dart';
import 'package:agricu/models/product.dart';
import 'package:agricu/models/product_section.dart';
import 'package:agricu/screens/home/bloc/dummy.dart';
import 'package:agricu/screens/home/bloc/home_page_enums.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:agricu/services/db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final db = DBMethods();
  final ProfileBloc? profileBloc;
  HomeBloc({required this.profileBloc})
      : super(HomeState(
            category: CategoryEnum.all, productSection: productSection)) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        final products = await db.getProducts(state.category!);
        if (products.isNotEmpty) {
          emit(state.copyWith(status: Status.success, products: products));
        } else {
          emit(state.copyWith(status: Status.empty));
        }
      } catch (e) {
        log('$e');
        emit(state.copyWith(status: Status.failed));
      }
    });

    on<OnChangedCategory>(((event, emit) {
      emit(state.copyWith(category: event.categoryEnum));
      add(GetProductsEvent());
    }));

    on<OnToggleFavourites>(((event, emit) async {
      if (state.favourites
          .where((element) =>
              element.productId.toString() == event.product.productId)
          .isNotEmpty) {
        await db.removeFavourite(profileBloc!.state.currentUser!.userId!,
            int.parse(event.product.productId!));
        final favourites = state.favourites
          ..remove(state.favourites
              .where((element) =>
                  element.productId == int.parse(event.product.productId!))
              .first);
        emit(state.copyWith(favourites: favourites));
      } else {
        final favourite = Favourite(
            product: event.product,
            productId: int.parse(event.product.productId!).toInt(),
            userId: profileBloc!.state.currentUser!.userId);
        final favourites = state.favourites..add(favourite);
        emit(state.copyWith(favourites: favourites));
        await db.addFavourite(favourite);
      }
    }));
    on<OnGetFavourites>(((event, emit) async {
      try {
        final favourites =
            await db.getFavourites(profileBloc!.state.currentUser!.userId!);
        log('$favourites');
        emit(state.copyWith(favourites: favourites));
      } catch (e) {
        log('$e');
      }
    }));
    on<OnRemoveFavourite>(((event, emit) async {
      final favourites = state.favourites
        ..remove(state.favourites
            .where((element) => element == event.favourite)
            .first);
      emit(state.copyWith(favourites: favourites));
      await db.removeFavourite(
          profileBloc!.state.currentUser!.userId!, event.favourite.productId!);
    }));
  }
}
