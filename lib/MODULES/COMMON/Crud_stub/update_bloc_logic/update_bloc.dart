import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc<T> extends Bloc<UpdateEvent<T>, UpdateState<T>> {
  UpdateBloc() : super(UpdateInitial<T>()) {
/* -------------------------------------------------------------------------- */
/*                                 //@ Update                                 */
/* -------------------------------------------------------------------------- */

    on<Update_ButtonPressed_Event<T>>((event, emit) async {
      emit(UpdateLoading_State<T>());

      try {
        // from api repo
        var response = await event.addFunc();
        print(response);
        emit(UpdateSuccess_State<T>());

        // error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(UpdateError_State<T>(storeErr));
      }
    });
  }
}
