import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final auth = AuthenticationRepository();
  ProfileBloc() : super(ProfileState()) {
    on<OnLogout>((event, emit) async {
      emit(state.copyWith(signOutState: LoadingState.loading));

      try {
        await auth.signOut();
        emit(state.copyWith(signOutState: LoadingState.success));
      } catch (e) {
        emit(state.copyWith(signOutState: LoadingState.failed));
      }
    });
  }
}
