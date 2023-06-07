part of 'login_button_bloc.dart';

abstract class LoginButtonEvent extends Equatable {
  const LoginButtonEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginButtonEvent {
  final modelObj;

  LoginButtonPressedEvent(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}
