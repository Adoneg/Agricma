import 'dart:developer';

import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/models/product.dart';
import 'package:agricu/models/product_section.dart';
import 'package:agricu/screens/home/bloc/dummy.dart';
import 'package:agricu/screens/home/bloc/home_page_enums.dart';
import 'package:agricu/services/db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final db = DBMethods();
  HomeBloc()
      : super(HomeState(
            category: CategoryEnum.vegetables,
            productSection: productSection)) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        final products = await db.getProducts();
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
    }));
  }
}
