import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_information_state.dart';

class UserInformationCubit extends Cubit<UserInformationState> {
  UserInformationCubit() : super(UserInformationInitial());
}
