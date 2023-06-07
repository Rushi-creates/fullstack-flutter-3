part of 'auth_tab_bar_bloc.dart';

abstract class AuthTabBarEvent extends Equatable {
  const AuthTabBarEvent();

  @override
  List<Object> get props => [];
}

class SwitchToLogin_Event extends AuthTabBarEvent {}

class SwitchToRegister_Event extends AuthTabBarEvent {}
