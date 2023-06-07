import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../API_HELPER/exceptions/exceptions.dart';
import '../../../SERIALIZERS/models/profile.dart';
import '../../../SERIALIZERS/repositories/profile_repo.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    //! add profile to fs
    on<EditProfile_ButtonPressed_Event>((event, emit) async {
      emit(EditProfile_loading_State());

      try {
        //# from api repo
        Profile response = event.isProfileUpdateEvent
            ? await ProfileRepo.instance
                .update_profile(event.modelObjToAdd, event.modelObjToAdd.p_uid)
            : await ProfileRepo.instance.add_profile(event.modelObjToAdd);

        //@ store profile in sp
        // await ProfileSpRepo.instance.set_profile(response);

        emit(EditProfile_success_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(EditProfile_error_State(storeErr));
      }
    });
  }
}
