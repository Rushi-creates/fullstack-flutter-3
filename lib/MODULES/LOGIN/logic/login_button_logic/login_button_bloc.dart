import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../SERIALIZERS/models/user.dart';
import '../../../../SERIALIZERS/repositories/user_repo.dart';

part 'login_button_event.dart';
part 'login_button_state.dart';

class LoginButtonBloc extends Bloc<LoginButtonEvent, LoginButtonState> {
  LoginButtonBloc() : super(LoginButtonInitial()) {
/* -------------------------------------------------------------------------- */
/*                               //@ Login                                */
/* -------------------------------------------------------------------------- */

    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginButtonLoadingState());

      try {
        var response = await UserRepo.instance.createLoginUser(event.modelObj);

        if (response is User) {
          emit(LoginButtonSuccessState(response));

          //# LOGIC : reponse is Stirng , means acc NOT added to DB (already exists)
        } else if (response is String) {
          emit(LoginButtonAccountDontExistErrorState(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(LoginButtonUnknownErrorState(storeErr));
      }
    });
  }
}
