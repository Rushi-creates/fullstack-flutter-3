part of 'fetch_bloc.dart';

abstract class FetchState<T> extends Equatable {
  final List fetchList;
  const FetchState({required this.fetchList});
  @override
  List<Object> get props => [fetchList];
}

class FetchInitial<T> extends FetchState<T> {
  final List fetchList;
  const FetchInitial({required this.fetchList}) : super(fetchList: fetchList);
}

class FetchList_Loading_State<T> extends FetchState<T> {
  final List fetchList;
  const FetchList_Loading_State({required this.fetchList})
      : super(fetchList: fetchList);
}

class FetchList_Loaded_State<T> extends FetchState<T> {
  final List fetchList;
  const FetchList_Loaded_State({required this.fetchList})
      : super(fetchList: fetchList);
}

class FetchList_LoadedEmpty_State<T> extends FetchState<T> {
  final List fetchList;
  const FetchList_LoadedEmpty_State({required this.fetchList})
      : super(fetchList: fetchList);
}

class FetchList_Error_State<T> extends FetchState<T> {
  final List fetchList;
  final error;
  const FetchList_Error_State({required this.fetchList, required this.error})
      : super(fetchList: fetchList);
}
