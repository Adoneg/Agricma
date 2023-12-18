import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'digit_code_verification_state.dart';

class DigitCodeVerificationCubit extends Cubit<DigitCodeVerificationState> {
  DigitCodeVerificationCubit() : super(DigitCodeVerificationInitial());
}
