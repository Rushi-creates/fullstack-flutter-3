import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SERIALIZERS/repositories/profile_repo.dart';
import '../../../SERIALIZERS/repositories/user_repo.dart';

part 'auth_session_manager_event.dart';
part 'auth_session_manager_state.dart';

class AuthSessionManagerBloc
    extends Bloc<AuthSessionManagerEvent, AuthSessionManagerState> {
  AuthSessionManagerBloc() : super(UserSessionInitialState()) {
/* -------------------------------------------------------------------------- */
/*                                  //! user                                  */
/* -------------------------------------------------------------------------- */

    on<StoreUserSessionEvent>((event, emit) async {
      await UserSpRepo.instance.set_user(event.user);
      emit(UserSessionStoredState());
    });

    //

    on<RemoveUserSessionEvent>((event, emit) async {
      await UserSpRepo.instance.remove_user();
      emit(UserSessionRemovedState());
    });

/* -------------------------------------------------------------------------- */
/*                                 //! profile                                */
/* -------------------------------------------------------------------------- */
    on<StoreProfileSessionEvent>((event, emit) async {
      await ProfileSpRepo.instance.set_profile(event.profile);
      emit(ProfileSessionStoredState());
      emit(UserSessionInitialState()); //added since profile update func exists
    });

    //

    on<RemoveProfileSessionEvent>((event, emit) async {
      await ProfileSpRepo.instance.remove_profile();
      emit(ProfileSessionRemovedState());
    });
  }
}
