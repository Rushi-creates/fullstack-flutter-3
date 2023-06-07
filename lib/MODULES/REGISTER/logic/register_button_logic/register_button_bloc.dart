import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../SERIALIZERS/models/user.dart';
import '../../../../SERIALIZERS/repositories/user_repo.dart';

part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial()) {
/* -------------------------------------------------------------------------- */
/*                               //@ Register                                */
/* -------------------------------------------------------------------------- */

    on<RegisterButtonPressedEvent>((event, emit) async {
      emit(RegisterButtonLoadingState());

      try {
        var response =
            await UserRepo.instance.createNoOtpRegister(event.modelObj);

        if (response is User) {
          emit(RegisterButtonSuccessState(response));

          //# LOGIC : reponse is Stirng , means acc NOT added to DB (already exists)
        } else if (response is String) {
          emit(RegisterButtonAccountDontExistErrorState(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(RegisterButtonUnknownErrorState(storeErr));
      }
    });
  }
}
