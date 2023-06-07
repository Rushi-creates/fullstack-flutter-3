part of 'create_bloc.dart';

abstract class CreateEvent<T> extends Equatable {
  const CreateEvent();

  @override
  List<Object> get props => [];
}

//! create

class Create_ButtonPressed_Event<T> extends CreateEvent<T> {
  final Future<dynamic> Function() addFunc;
  Create_ButtonPressed_Event(this.addFunc);
  @override
  List<Object> get props => [addFunc];
}
