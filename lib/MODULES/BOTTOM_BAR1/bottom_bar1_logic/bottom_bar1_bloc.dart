import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar1_event.dart';
part 'bottom_bar1_state.dart';

class BottomBar1Bloc extends Bloc<BottomBar1Event, BottomBar1State> {
  BottomBar1Bloc() : super(BottomBar1Initial()) {
    // first icon

    on<BottomBar1_OneCLicked_Event>(
        (event, emit) => emit(BottomBar1_openOne_State()));

    // second icon
    on<BottomBar1_TwoCLicked_Event>(
        (event, emit) => emit(BottomBar1_openTwo_State()));

    // third icon
    on<BottomBar1_ThreeCLicked_Event>(
        (event, emit) => emit(BottomBar1_openThree_State()));
  }
}
