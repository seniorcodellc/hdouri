class CubitStates {}

class InitialState extends CubitStates {}

class LoadingState<T> extends InitialState {
  final T? data;
  LoadingState({this.data});
}

class LoadingMoreState<T> extends InitialState {
  final T data;
  LoadingMoreState({required this.data});
}

class ChangeState extends InitialState {}

class FailedState extends InitialState {
  String message;
  FailedState({required this.message});
}

class LoadedState<T> extends InitialState {
  final T data;
  LoadedState({required this.data});
}
