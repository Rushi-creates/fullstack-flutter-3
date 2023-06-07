import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../SERIALIZERS/models/user.dart';
import '../../../../SERIALIZERS/repositories/user_repo.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(DeleteAccountInitial()) {
    on<DeleteAccountButtonPressedEvent>((event, emit) async {
      emit(DeleteAccountLoadingState());

      //# get SP :
      User user = UserSpRepo.instance.get_user()!;
      int id = user.id!;

      //Todo: delete each user realated DB , using deleteByUid url path
      try {
        //# deleting acc from DB
        var response = await UserRepo.instance.deleteUser_account(id);
        print('response decoded from api===>$response');

        emit(DeleteAccountSuccessState());

        //#error
      } catch (e) {
        emit(DeleteAccountFailureState());
      }
    });
  }
}
