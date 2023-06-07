import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SERIALIZERS/models/user.dart';
import '../../../SERIALIZERS/repositories/user_repo.dart';

part 'user_lod_event.dart';
part 'user_lod_state.dart';

class UserLodBloc extends Bloc<UserLodEvent, UserLodState> {
  UserLodBloc() : super(UserLodInitial()) {
/* -------------------------------------------------------------------------- */
/*                                 //! Logout                                 */
/* -------------------------------------------------------------------------- */

    // on<UserLogoutButtonPressedEvent>((event, emit) async {
    //   emit(UserLogout_Loading_State());

    //   //# remove SP : after log out
    //   await ProfileSpRepo.instance.remove_profile();
    //   await UserSpRepo.instance.remove_user().then((value) {
    //     emit(UserLogout_Success_State());
    //   }).catchError((e, s) {
    //     emit(UserLogout_Failure_State());
    //   });
    // });

/* -------------------------------------------------------------------------- */
/*                          //! Logout for superAdmin                         */
/* -------------------------------------------------------------------------- */
    // on<Logout_forSuperAdmin_ButtonPressedEvent>((event, emit) async {
    //   emit(Logout_SuperAdmin_Loading_State());

    //   //# remove SP : remove superAdmin=true key , to log out SA
    //   await account_sp_repo.removeSuperAdmin().then((value) {
    //     emit(Logout_SuperAdmin_Success_State());
    //   }).catchError((e, st) {
    //     emit(Logout_SuperAdmin_Failure_State());
    //   });
    // });

/* -------------------------------------------------------------------------- */
/*                           //! Delete user Account                          */
/* -------------------------------------------------------------------------- */
    on<UserDeleteUserAccount_ButtonPressedEvent>((event, emit) async {
      emit(UserDeleteUserAccount_Loading_State());

      //# get SP :
      User user = UserSpRepo.instance.get_user()!;
      int id = user.id!;

      //Todo: delete each user realated DB , using deleteByUid url path
      try {
        //# deleting acc from DB
        var response = await UserRepo.instance.deleteUser_account(id);
        print('response decoded from api===>$response');

        //# remove SP : when User/Admin deletes acc

        // await UserSpRepo.instance.remove_user()
        // .then((value) {
        emit(UserDeleteUserAccount_Success_State());
        // }).catchError((e, s) {
        //   emit(UserDeleteUserAccount_Success_State());
        // });

        //#error
      } catch (e) {
        emit(UserDeleteUserAccount_Failure_State());
      }
    });
  }
}
