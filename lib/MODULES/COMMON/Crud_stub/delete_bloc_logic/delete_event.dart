part of 'delete_bloc.dart';

abstract class DeleteEvent<T> extends Equatable {
  const DeleteEvent();

  @override
  List<Object> get props => [];
}

//! delete

class Delete_ButtonPressed_Event<T> extends DeleteEvent<T> {
  final Future<dynamic> Function() addFunc;
  Delete_ButtonPressed_Event(this.addFunc);
  @override
  List<Object> get props => [addFunc];
}
