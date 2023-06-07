import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_tab_bar_event.dart';
part 'auth_tab_bar_state.dart';

class AuthTabBarBloc extends Bloc<AuthTabBarEvent, AuthTabBarState> {
  AuthTabBarBloc() : super(AuthTabBarInitial()) {
    //
    on<SwitchToLogin_Event>((event, emit) => emit(SwitchedToLogin_State()));

    //
    on<SwitchToRegister_Event>(
        (event, emit) => emit(SwitchedToRegister_State()));
  }
}
