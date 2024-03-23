part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class OnLogout extends ProfileEvent {}

class OnInit extends ProfileEvent {}

class OnSetCurrentUser extends ProfileEvent {
  final AppUser? currentUser;
  OnSetCurrentUser({this.currentUser});
}
