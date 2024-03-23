part of 'profile_bloc.dart';

class ProfileState {
  final LoadingState? signOutState;
  final bool? hasAppInitialized;
  final AppUser? currentUser;
  ProfileState(
      {this.signOutState = LoadingState.initial,
      this.currentUser,
      this.hasAppInitialized});

  ProfileState copyWith(
      {LoadingState? signOutState,
      AppUser? currentUser,
      bool? hasAppInitialized}) {
    return ProfileState(
        currentUser: currentUser ?? this.currentUser,
        signOutState: signOutState ?? this.signOutState,
        hasAppInitialized: hasAppInitialized ?? this.hasAppInitialized);
  }
}
