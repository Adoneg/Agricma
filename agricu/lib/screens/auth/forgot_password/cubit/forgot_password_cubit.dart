import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final auth = AuthenticationRepository();
  ForgotPasswordCubit() : super(ForgotPasswordState());

  changedEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  submitButtonClicked() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    try {
      await auth.sendPasswordReset(state.email);
      emit(state.copyWith(loadingState: LoadingState.success));
    } catch (e) {
      emit(state.copyWith(loadingState: LoadingState.failed));
    }
  }
}
