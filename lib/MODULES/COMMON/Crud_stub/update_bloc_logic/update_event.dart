part of 'update_bloc.dart';

abstract class UpdateEvent<T> extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

//! update

class Update_ButtonPressed_Event<T> extends UpdateEvent<T> {
  final Future<dynamic> Function() addFunc;
  Update_ButtonPressed_Event(this.addFunc);
  @override
  List<Object> get props => [addFunc];
}
