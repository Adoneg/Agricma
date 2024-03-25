part of 'favourites_bloc.dart';

class FavouritesState {
  final List<Favourite> favourites;
  final Status? status;
  FavouritesState({this.favourites = const [], this.status});

  FavouritesState copyWith({List<Favourite>? favourites, Status? status}) {
    return FavouritesState(
      favourites: favourites ?? this.favourites,
      status: status ?? this.status,
    );
  }
}
