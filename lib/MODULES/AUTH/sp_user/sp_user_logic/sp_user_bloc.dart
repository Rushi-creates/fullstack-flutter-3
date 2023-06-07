import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../SERIALIZERS/models/profile.dart';
import '../../../../SERIALIZERS/repositories/profile_repo.dart';
import '../../../../SERIALIZERS/repositories/user_repo.dart';

part 'sp_user_event.dart';
part 'sp_user_state.dart';

class SpUserBloc extends Bloc<SpUserEvent, SpUserState> {
  SpUserBloc() : super(UserSessionInitialState()) {
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

/* -------------------------------------------------------------------------- */
/*                                 //@ @ FETCH                                */
/* -------------------------------------------------------------------------- */

    on<CheckSpEvent>((event, emit) async {
      try {
/* -------------------------------------------------------------------------- */
/*                                  //! Vars                                  */
/* -------------------------------------------------------------------------- */

        //@ checking sp for gauth
        var id = UserSpRepo.instance.get_user()?.id;
        print('from splash bloc=> this is id = ${id}');

        //@ checking sp for stage 2 : is profile created

        Profile? profileObj = ProfileSpRepo.instance.get_profile();
        print('from splash bloc=> this is profile sp obj = ${profileObj}');

/* -------------------------------------------------------------------------- */
/*                                //! USER ROLE                               */
/* -------------------------------------------------------------------------- */
        if (id != null
            //* && email != null && name != null && photoUrl != null
            &&
            profileObj != null) {
          print('user role');
          emit(UserAndProfileInSpState());
        }

/* -------------------------------------------------------------------------- */
/*                           //! Create Profile Role                          */
/* -------------------------------------------------------------------------- */

        else if (id != null && profileObj == null) {
          //@ profile created in sp is false, since device might be changed
          //@ but profile created might be true in remote api
          print('inside checking does prop exists');

          //check in fs table of userName & bio ( if doc exists or not)
          var result = await ProfileRepo.instance.doesProfileExists(id);
          //
          if (result is Profile) {
            await ProfileSpRepo.instance.set_profile(result);
            print('profile stored in sp, from fs and now user role');
            emit(UserAndProfileInSpState());

            //
          } else if (result == false) {
            print('Profile not created role');
            emit(EmptyProfileSpState());
          }
        }

/* -------------------------------------------------------------------------- */
/*                            //! Auth screen Role                            */
/* -------------------------------------------------------------------------- */
        else {
          emit(EmptySpState());
        }

/* -------------------------------------------------------------------------- */
/*                                  //! error                                 */
/* -------------------------------------------------------------------------- */
      } catch (e) {
        print('role error state $e');
        emit(SpErrorState());
      }
    });
  }
}
