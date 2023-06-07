part of 'bottom_bar1_bloc.dart';

abstract class BottomBar1Event extends Equatable {
  const BottomBar1Event();

  @override
  List<Object> get props => [];
}

class BottomBar1_OneCLicked_Event extends BottomBar1Event {}

class BottomBar1_TwoCLicked_Event extends BottomBar1Event {}

class BottomBar1_ThreeCLicked_Event extends BottomBar1Event {}
