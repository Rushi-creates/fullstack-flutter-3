part of 'auth_session_manager_bloc.dart';

abstract class AuthSessionManagerState extends Equatable {
  const AuthSessionManagerState();

  @override
  List<Object> get props => [];
}

class UserSessionInitialState extends AuthSessionManagerState {}

//user
class UserSessionStoredState extends AuthSessionManagerState {}

class UserSessionRemovedState extends AuthSessionManagerState {}

//profile
class ProfileSessionStoredState extends AuthSessionManagerState {}

class ProfileSessionRemovedState extends AuthSessionManagerState {}
