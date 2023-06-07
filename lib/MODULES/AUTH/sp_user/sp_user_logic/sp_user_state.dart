part of 'sp_user_bloc.dart';

abstract class SpUserState extends Equatable {
  const SpUserState();

  @override
  List<Object> get props => [];
}

class UserSessionInitialState extends SpUserState {}

class SpErrorState extends SpUserState {}

//user
class UserSessionStoredState extends SpUserState {}

class UserSessionRemovedState extends SpUserState {}

//profile
class ProfileSessionStoredState extends SpUserState {}

class ProfileSessionRemovedState extends SpUserState {}

/* -------------------------------------------------------------------------- */
/*                                  //@ Fetch                                 */
/* -------------------------------------------------------------------------- */

//
class UserAndProfileInSpState extends SpUserState {}

class EmptySpState extends SpUserState {}

class EmptyProfileSpState extends SpUserState {}
