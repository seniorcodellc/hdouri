sealed class BaseState {}

class BaseInitialState extends BaseState {}

class BaseLoadingState extends BaseState {}

class BaseErrorState<String> extends BaseState {
  final String message;

  BaseErrorState({required this.message});
}

class BaseSuccessState<T> extends BaseState {
  final T response;

  BaseSuccessState({required this.response});
}
