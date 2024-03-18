import 'dart:developer';

import 'package:agricu/enums/fetch_state_enum.dart';
import 'package:agricu/models/request.dart';
import 'package:agricu/models/user.dart';
import 'package:agricu/services/db.dart';
import 'package:agricu/services/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'request_to_sell_event.dart';
part 'request_to_sell_state.dart';

class RequestToSellBloc extends Bloc<RequestToSellEvent, RequestToSellState> {
  final AppUser? user;
  final storage = Storage();
  final db = DBMethods();
  RequestToSellBloc({this.user}) : super(RequestToSellState()) {
    on<OnCompanyName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<OnLocation>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
    on<OnNumber>((event, emit) {
      emit(state.copyWith(number: event.number));
    });
    on<OnEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<OnWorkingHours>((event, emit) {
      emit(state.copyWith(startTime: event.startTime, endTime: event.endTime));
    });
    on<OnLogo>((event, emit) {
      emit(state.copyWith(logo: event.logo));
    });

    on<OnSubmitRequest>((event, emit) async {
      emit(state.copyWith(requestSubmissionState: FetchState.loading));
      try {
        String? logo;
        if (state.logo != null) {
          logo = await storage.uploadImage(state.logo!, 'logos');
        }

        final request = Request(
            businessEmail: state.email,
            businessNumber: state.number,
            companyName: state.name,
            location: state.location,
            logo: logo,
            userId: user?.userId,
            workingHours: (state.startTime!, state.endTime!));
        await db.requestToSell(request);
        //store request;
        emit(state.copyWith(requestSubmissionState: FetchState.success));
      } catch (e) {
        log('$e');
        emit(state.copyWith(requestSubmissionState: FetchState.failed));
      }
    });
  }
}
