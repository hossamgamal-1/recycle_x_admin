part of 'web_services_cubit.dart';

@immutable
abstract class WebServicesState {}

class WebServicesInitialState extends WebServicesState {}

class FormChangeState extends WebServicesState {}

class WaitingState extends WebServicesState {}

class LoadedState extends WebServicesState {
  final User user;

  LoadedState(this.user);
}

class FailureState extends WebServicesState {
  final String error;

  FailureState(this.error);
}
