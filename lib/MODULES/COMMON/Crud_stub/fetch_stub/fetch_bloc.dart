import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc<T> extends Bloc<FetchEvent<T>, FetchState<T>> {
  int counter = 0;

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

  FetchBloc() : super(FetchInitial<T>(fetchList: [])) {
/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<List_Fetch_Event<T>>((event, emit) async {
      print('list fetch event called');
      print(state.fetchList);
      try {
        emit(FetchList_Loading_State<T>(fetchList: state.fetchList));

        counter++; //incr counter
        print(counter);

        final List moreListFetched = await event.myFetchFunc(counter);

        // if nothing more is to fetch
        if (moreListFetched.isEmpty) {
          emit(FetchList_LoadedEmpty_State<T>(fetchList: state.fetchList));

          // adding more fetched to final list
        } else if (moreListFetched.isNotEmpty) {
          state.fetchList.addAll(moreListFetched);
          emit(FetchList_Loaded_State<T>(fetchList: state.fetchList));
        }

        // catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FetchList_Error_State<T>(
            error: storeErr, fetchList: state.fetchList));
      }
    });

/* -------------------------------------------------------------------------- */
/*                               //@ Refresh                                  */
/* -------------------------------------------------------------------------- */

    on<List_Refresh_Event<T>>((event, emit) async {
      counter = 0;
      state.fetchList.clear();
    });
  }
}
