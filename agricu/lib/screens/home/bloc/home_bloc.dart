import 'package:agricu/models/category_enum.dart';
import 'package:agricu/models/product_section.dart';
import 'package:agricu/screens/home/bloc/dummy.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
            category: CategoryEnum.vegetables,
            productSection: productSection)) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
