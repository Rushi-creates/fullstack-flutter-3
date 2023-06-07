part of 'auth_session_manager_bloc.dart';

abstract class AuthSessionManagerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//! User
class StoreUserSessionEvent extends AuthSessionManagerEvent {
  final user;
  StoreUserSessionEvent(this.user);
  @override
  List<Object> get props => [user];
}

class RemoveUserSessionEvent extends AuthSessionManagerEvent {}

//! Profile
class StoreProfileSessionEvent extends AuthSessionManagerEvent {
  final profile;
  StoreProfileSessionEvent(this.profile);
  @override
  List<Object> get props => [profile];
}

class RemoveProfileSessionEvent extends AuthSessionManagerEvent {}
