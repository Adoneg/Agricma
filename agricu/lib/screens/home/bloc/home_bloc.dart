import 'dart:developer';

import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/models/product_section.dart';
import 'package:agricu/screens/home/bloc/dummy.dart';
import 'package:agricu/screens/home/bloc/home_page_enums.dart';
import 'package:agricu/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final apiService = ApiService();
  HomeBloc()
      : super(HomeState(
            category: CategoryEnum.vegetables,
            productSection: productSection)) {
    on<GetProductsEvent>((event, emit) async {
      try {
        // final res = await apiService.getCategories();
        final res2 = await apiService.getProducts('food');
        // log('$res');
        log('$res2');
      } catch (e) {
        log('$e');
      }
    });
  }
}
