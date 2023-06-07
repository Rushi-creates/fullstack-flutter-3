part of 'register_button_bloc.dart';

abstract class RegisterButtonEvent extends Equatable {
  const RegisterButtonEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressedEvent extends RegisterButtonEvent {
  final modelObj;

  RegisterButtonPressedEvent(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}
