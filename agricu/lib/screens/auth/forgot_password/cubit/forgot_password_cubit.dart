import 'package:agricu/enums/loading_state_enum.dart';
import 'package:bloc/bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState());

  changedEmail() {}
  submitButtonClicked() {}
}
