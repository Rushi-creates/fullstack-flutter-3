part of 'delete_bloc.dart';

abstract class DeleteState<T> extends Equatable {
  const DeleteState();

  @override
  List<Object> get props => [];
}

class DeleteInitial<T> extends DeleteState<T> {}

class DeleteLoading_State<T> extends DeleteState<T> {}

class DeleteSuccess_State<T> extends DeleteState<T> {}

class DeleteError_State<T> extends DeleteState<T> {
  final error;
  DeleteError_State(this.error);
  @override
  List<Object> get props => [error];
}
