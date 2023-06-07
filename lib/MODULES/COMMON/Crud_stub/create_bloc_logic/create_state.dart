part of 'create_bloc.dart';

abstract class CreateState<T> extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class CreateInitial<T> extends CreateState<T> {}

class CreateLoading_State<T> extends CreateState<T> {}

class CreateSuccess_State<T> extends CreateState<T> {}

class CreateError_State<T> extends CreateState<T> {
  final error;
  CreateError_State(this.error);
  @override
  List<Object> get props => [error];
}
