part of 'login_button_bloc.dart';

abstract class LoginButtonState extends Equatable {
  const LoginButtonState();

  @override
  List<Object> get props => [];
}

class LoginButtonInitial extends LoginButtonState {}

class LoginButtonLoadingState extends LoginButtonState {}

class LoginButtonSuccessState extends LoginButtonState {
  final loggedIn;
  const LoginButtonSuccessState(this.loggedIn);
  @override
  List<Object> get props => [loggedIn];
}

class LoginButtonAccountDontExistErrorState extends LoginButtonState {
  final msg;
  LoginButtonAccountDontExistErrorState(this.msg);
}

class LoginButtonUnknownErrorState extends LoginButtonState {
  final error;
  LoginButtonUnknownErrorState(this.error);
  @override
  List<Object> get props => [error];
}
