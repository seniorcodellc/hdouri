import '../../exports.dart';
import '../../features/authentication/presentation/managers/auth_cubit.dart';

T getBlocData<T extends StateStreamableSource<Object?>>() => BlocProvider.of<T>(getContext);

Future<T?> managerExecute<T>(
  Future<Either<Failure, ResponseModel>> either, {
  Function(T? data)? onSuccess,
  Function()? onStart,
  Function(String message)? onFail,
  Function(String message, T? data)? onNetworkFail,
}) async {
  T? data;
  onStart?.call();
  (await either).fold(
    (Failure failure) {
      // if (failure.code == ResponseCode.UNAUTHORISED && getBlocData<AuthCubit>().userData.isNotNull) {
      //   getBlocData<AuthCubit>().clearUser();
      // }
      print("fffffffffff" + failure.code.toString());
      if (failure.code == ResponseCode.UNAUTHORISED && getBlocData<AuthCubit>().user.isNotNull) {
        getBlocData<AuthCubit>().clearUser();
      }
      if (failure.code == ResponseCode.NO_INTERNET_CONNECTION) {
        data = failure.data;

        onNetworkFail?.call(failure.message, data);
      } else {
        onFail?.call(failure.message);
      }
    },
    (ResponseModel value) {
      data = value.data;
      onSuccess?.call(data);
    },
  );
  return data;
}

Future<R?> executeWithDialog<R>({
  /// A required `Future<Either<Failure, R>>` future representing the asynchronous operation.
  required Future<Either<Failure, ResponseModel>> either,

  /// The message to display in the dialog while the operation is running.
  required String startingMessage,
  String? responseMessage,

  /// A function to be called with the error message if the operation fails.
  Function(String message)? onError,

  /// A function to be called with the response data if the operation succeeds.
  required Function(R? data) onSuccess,

  /// An optional function to be called before starting the operation (e.g., for showing a loading indicator).
  Function()? onStart,

  Future<void> Function(dynamic data)? beforeSuccess,
}) async {
  /// Call the optional `onStart` function if provided.
  onStart?.call();
  R? data;

  /// Show a custom dialog with the `startingMessage` using `AppService.showCustomDialog`.
  showCustomDialog(isAlert: false, message: startingMessage);

  /// Await the result of the `either` future and handle it using `fold`.
  (await either).fold(
    (Failure failure) async {
      /// Extract the error message from the `Failure` object.
      print("fffffffffff" + failure.code.toString());
      var message = failure.message;
      if (failure.code == ResponseCode.UNAUTHORISED && getBlocData<AuthCubit>().user.isNotNull) {
        getBlocData<AuthCubit>().clearUser();
      }

      //pop();
      /// Show a custom error dialog with a timeout using `AppService.showCustomDialogWithTimer`.
      /// The timeout calls the `onError` function with the error message.
      await showCustomDialogWithTimer(
        message: message,
        dialogTimingType: DialogTimingTypes.long,
        dialogType: AlertTypes.error,
        onTimeOut: () => onError?.call(message),
      );
    },
    (response) async {
      /// Extract the data from the successful response (`R`).
      data = response.data;
      await beforeSuccess?.call(data);

      //  pop();

      /// Show a custom success dialog with a timeout using `AppService.showCustomDialogWithTimer`.
      /// The timeout calls the `onSuccess` function with the data.
      await showCustomDialogWithTimer(
        message: response.message ?? responseMessage,
        dialogType: AlertTypes.success,
        onTimeOut: () {
          onSuccess.call(data);
        },
      );
    },
  );
  return data;
}

Future<void> pushScreenWithMultipleBlocs<T>({
  required BuildContext context,
  required Widget screen,
  required List<BlocProvider> blocProviders,
}) async {
  Widget wrappedScreen = screen;

  // Wrap the screen with each BlocProvider in the correct order
}

Future<R?> executeWithSnackBar<R>({
  /// A required `Future<Either<Failure, R>>` future representing the asynchronous operation.
  required Future<Either<Failure, ResponseModel>> either,

  /// The message to display in the dialog while the operation is running.
  required String startingMessage,

  /// A function to be called with the error message if the operation fails.
  Function(String message)? onError,

  /// A function to be called with the response data if the operation succeeds.
  required Function(R? data) onSuccess,

  /// An optional function to be called before starting the operation (e.g., for showing a loading indicator).
  Function()? onStart,
  Future<void> Function(dynamic data)? beforeSuccess,
}) async {
  /// Call the optional `onStart` function if provided.
  // onStart?.call();
  R? data;

  /// Show a custom dialog with the `startingMessage` using `AppService.showCustomDialog`.
  showSnackBar(duration: AppConstants.connectTimeOut, message: startingMessage, alertType: AlertTypes.loading);

  /// Await the result of the `either` future and handle it using `fold`.
  (await either).fold(
    (Failure failure) async {
      /// Extract the error message from the `Failure` object.
      dismissSnackBar();

      showSnackBar(duration: 500.milliseconds, message: failure.message, alertType: AlertTypes.error);

      onError?.call(failure.message);
      //pop();
      /// Show a custom error dialog with a timeout using `AppService.showCustomDialogWithTimer`.
      /// The timeout calls the `onError` function with the error message.
    },
    (response) async {
      /// Extract the data from the successful response (`R`).
      data = response.data;
      await beforeSuccess?.call(data);
      dismissSnackBar();
      showSnackBar(duration: 500.milliseconds, message: response.message.validate, alertType: AlertTypes.success);
      onSuccess.call(data);

      /// Show a custom success dialog with a timeout using `AppService.showCustomDialogWithTimer`.
      /// The timeout calls the `onSuccess` function with the data.
    },
  );
  return data;
}
