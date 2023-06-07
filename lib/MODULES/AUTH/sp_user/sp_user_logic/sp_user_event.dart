part of 'sp_user_bloc.dart';

abstract class SpUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/* -------------------------------------------------------------------------- */
/*                         //@ Store, update , delete                         */
/* -------------------------------------------------------------------------- */

//! User
class StoreUserSessionEvent extends SpUserEvent {
  final user;
  StoreUserSessionEvent(this.user);
  @override
  List<Object> get props => [user];
}

class RemoveUserSessionEvent extends SpUserEvent {}

//! Profile
class StoreProfileSessionEvent extends SpUserEvent {
  final profile;
  StoreProfileSessionEvent(this.profile);
  @override
  List<Object> get props => [profile];
}

class RemoveProfileSessionEvent extends SpUserEvent {}

/* -------------------------------------------------------------------------- */
/*                                  //@ Fetch                                 */
/* -------------------------------------------------------------------------- */

class CheckSpEvent extends SpUserEvent {}
