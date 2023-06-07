part of 'fetch_bloc.dart';

abstract class FetchEvent<T> extends Equatable {
  const FetchEvent();
  @override
  List<Object> get props => [];
}

class List_Fetch_Event<T> extends FetchEvent<T> {
  final Future<dynamic> Function(int counter) myFetchFunc;
  List_Fetch_Event(this.myFetchFunc);
  @override
  List<Object> get props => [myFetchFunc];
}

class List_Refresh_Event<T> extends FetchEvent<T> {}
