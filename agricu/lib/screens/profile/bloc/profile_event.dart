part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class OnLogout extends ProfileEvent {}

class OnInit extends ProfileEvent {}
