import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc<T> extends Bloc<DeleteEvent<T>, DeleteState<T>> {
  DeleteBloc() : super(DeleteInitial<T>()) {
/* -------------------------------------------------------------------------- */
/*                                 //@ Delete                                 */
/* -------------------------------------------------------------------------- */

    on<Delete_ButtonPressed_Event<T>>((event, emit) async {
      emit(DeleteLoading_State<T>());

      try {
        // from api repo
        var response = await event.addFunc();

        if (response is String) {
          emit(DeleteSuccess_State<T>());
        } else {
          emit(DeleteError_State<T>('Unknown error'));
        }

        // error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(DeleteError_State<T>(storeErr));
      }
    });
  }
}
