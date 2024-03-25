import 'package:agricu/models/favourites.dart';
import 'package:agricu/screens/home/bloc/home_page_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState()) {
    on<FavouritesEvent>((event, emit) {});
  }
}
