part of 'update_bloc.dart';

abstract class UpdateState<T> extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateInitial<T> extends UpdateState<T> {}

class UpdateLoading_State<T> extends UpdateState<T> {}

class UpdateSuccess_State<T> extends UpdateState<T> {}

class UpdateError_State<T> extends UpdateState<T> {
  final error;
  UpdateError_State(this.error);
  @override
  List<Object> get props => [error];
}
