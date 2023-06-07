part of 'register_button_bloc.dart';

abstract class RegisterButtonState extends Equatable {
  const RegisterButtonState();

  @override
  List<Object> get props => [];
}

class RegisterButtonInitial extends RegisterButtonState {}

class RegisterButtonLoadingState extends RegisterButtonState {}

class RegisterButtonSuccessState extends RegisterButtonState {
  final loggedIn;
  const RegisterButtonSuccessState(this.loggedIn);
  @override
  List<Object> get props => [loggedIn];
}

class RegisterButtonAccountDontExistErrorState extends RegisterButtonState {
  final msg;
  RegisterButtonAccountDontExistErrorState(this.msg);
}

class RegisterButtonUnknownErrorState extends RegisterButtonState {
  final error;
  RegisterButtonUnknownErrorState(this.error);
  @override
  List<Object> get props => [error];
}
