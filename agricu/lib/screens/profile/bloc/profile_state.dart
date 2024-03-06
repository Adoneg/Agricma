part of 'profile_bloc.dart';

class ProfileState {
  final LoadingState? signOutState;
  ProfileState({this.signOutState = LoadingState.initial});

  ProfileState copyWith({LoadingState? signOutState}) {
    return ProfileState(
      signOutState: signOutState ?? this.signOutState,
    );
  }
}
