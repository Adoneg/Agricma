part of 'request_to_sell_bloc.dart';

class RequestToSellState {
  final String? name;
  final String? location;
  final String? number;
  final String? email;
  final String? startTime;
  final String? endTime;
  final XFile? logo;
  final FetchState requestSubmissionState;

  RequestToSellState(
      {this.email,
      this.endTime,
      this.location,
      this.logo,
      this.name,
      this.number,
      this.startTime,
      this.requestSubmissionState = FetchState.initial});

  RequestToSellState copyWith(
      {String? name,
      FetchState? requestSubmissionState,
      String? location,
      String? number,
      String? email,
      String? startTime,
      String? endTime,
      XFile? logo}) {
    return RequestToSellState(
        requestSubmissionState:
            requestSubmissionState ?? this.requestSubmissionState,
        name: name ?? this.name,
        location: location ?? this.location,
        number: number ?? this.number,
        email: email ?? this.email,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        logo: logo ?? this.logo);
  }
}
