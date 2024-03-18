part of 'request_to_sell_bloc.dart';

@immutable
sealed class RequestToSellEvent {}

class OnCompanyName extends RequestToSellEvent {
  final String? name;
  OnCompanyName({this.name});
}

class OnLocation extends RequestToSellEvent {
  final String? location;
  OnLocation({this.location});
}

class OnNumber extends RequestToSellEvent {
  final String? number;
  OnNumber({this.number});
}

class OnEmail extends RequestToSellEvent {
  final String? email;
  OnEmail({this.email});
}

class OnWorkingHours extends RequestToSellEvent {
  final String? startTime;
  final String? endTime;
  OnWorkingHours({this.startTime, this.endTime});
}

class OnLogo extends RequestToSellEvent {
  final XFile? logo;
  OnLogo({this.logo});
}

class OnSubmitRequest extends RequestToSellEvent {}
