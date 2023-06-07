part of 'auth_tab_bar_bloc.dart';

abstract class AuthTabBarState extends Equatable {
  const AuthTabBarState();

  @override
  List<Object> get props => [];
}

class AuthTabBarInitial extends AuthTabBarState {}

class SwitchedToLogin_State extends AuthTabBarState {}

class SwitchedToRegister_State extends AuthTabBarState {}
