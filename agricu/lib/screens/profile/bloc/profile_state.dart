part of 'profile_bloc.dart';

class ProfileState {
  final LoadingState? signOutState;
  final AppUser? currentUser;
  ProfileState({this.signOutState = LoadingState.initial, this.currentUser});

  ProfileState copyWith({LoadingState? signOutState, AppUser? currentUser}) {
    return ProfileState(
      currentUser: currentUser ?? this.currentUser,
      signOutState: signOutState ?? this.signOutState,
    );
  }
}
