import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc<T> extends Bloc<CreateEvent<T>, CreateState<T>> {
  CreateBloc() : super(CreateInitial<T>()) {
/* -------------------------------------------------------------------------- */
/*                                 //@ Create                                 */
/* -------------------------------------------------------------------------- */

    on<Create_ButtonPressed_Event<T>>((event, emit) async {
      emit(CreateLoading_State<T>());

      try {
        // from api repo
        var response = await event.addFunc();
        debugPrint(response.toString());
        emit(CreateSuccess_State<T>());

        // error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(CreateError_State<T>(storeErr));
      }
    });
  }
}
