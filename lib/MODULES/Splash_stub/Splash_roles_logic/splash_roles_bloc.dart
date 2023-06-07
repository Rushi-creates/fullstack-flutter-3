import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SERIALIZERS/models/profile.dart';
import '../../../SERIALIZERS/repositories/profile_repo.dart';
import '../../../SERIALIZERS/repositories/user_repo.dart';

part 'splash_roles_event.dart';
part 'splash_roles_state.dart';

class SplashRolesBloc extends Bloc<SplashRolesEvent, SplashRolesState> {
  //

  SplashRolesBloc() : super(SplashRolesInitial()) {
/* -------------------------------------------------------------------------- */
/*                       //! Check role in splash screen                      */
/* -------------------------------------------------------------------------- */
    on<CheckRole_OnAppStartUpEvent>((event, emit) async {
      emit(RoleLoadingState());

      try {
/* -------------------------------------------------------------------------- */
/*                                  //! Vars                                  */
/* -------------------------------------------------------------------------- */

        //@ checking sp for gauth
        var id = UserSpRepo.instance.get_user()?.id;
        print('from splash bloc=> this is id = ${id}');

        //@ checking sp for stage 2 : is profile created

        Profile? profile_sp_obj = ProfileSpRepo.instance.get_profile();
        print('from splash bloc=> this is profile sp obj = ${profile_sp_obj}');

/* -------------------------------------------------------------------------- */
/*                                //! USER ROLE                               */
/* -------------------------------------------------------------------------- */
        if (id != null
            //* && email != null && name != null && photoUrl != null
            &&
            profile_sp_obj != null) {
          print('user role');
          emit(User_Role_State());
        }

/* -------------------------------------------------------------------------- */
/*                           //! Create Profile Role                          */
/* -------------------------------------------------------------------------- */

        else if (id != null && profile_sp_obj == null) {
          //@ profile created in sp is false, since device might be changed
          //@ but profile created might be true in remote api
          print('inside checking does prop exists');

          //check in fs table of userName & bio ( if doc exists or not)
          var result = await ProfileRepo.instance.doesProfileExists(id);
          //
          if (result is Profile) {
            await ProfileSpRepo.instance.set_profile(result);
            print('profile stored in sp, from fs and now user role');
            emit(User_Role_State());

            //
          } else if (result == false) {
            print('Profile not created role');
            emit(ProfileNotCreated_Role_State());
          }
        }

/* -------------------------------------------------------------------------- */
/*                            //! Auth screen Role                            */
/* -------------------------------------------------------------------------- */
        else {
          emit(SelectRoleScreen_state());
        }

/* -------------------------------------------------------------------------- */
/*                                  //! error                                 */
/* -------------------------------------------------------------------------- */
      } catch (e) {
        print('role error state $e');
        emit(RoleErrorState());
      }
    });
  }
}
