import 'dart:developer';

import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/models/user.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthenticationRepository? auth;
  ProfileBloc({this.auth}) : super(ProfileState()) {
    on<OnLogout>((event, emit) async {
      emit(state.copyWith(signOutState: LoadingState.loading));
      try {
        await auth?.signOut();
        emit(state.copyWith(signOutState: LoadingState.success));
      } catch (e) {
        emit(state.copyWith(signOutState: LoadingState.failed));
      }
    });
    on<OnSetCurrentUser>((event, emit) async {
      emit(state.copyWith(currentUser: event.currentUser));
    });
    on<OnInit>((event, emit) async {
      try {
        if (auth?.currenSupabaseUser == null) {
          emit(state.copyWith(hasAppInitialized: true));
          return;
        }
        final user = await auth?.userDB.getCurrenUser();
        emit(state.copyWith(currentUser: user, hasAppInitialized: true));
      } catch (e) {
        log('$e');
        final user = await auth?.userDB.activeUser();
        emit(state.copyWith(currentUser: user, hasAppInitialized: true));
      }
    });
  }
}
