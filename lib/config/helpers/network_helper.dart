
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hdouri/exports.dart';


Future<bool> checkConnection() async {
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      (connectivityResult.contains(ConnectivityResult.wifi) || !(connectivityResult.contains(ConnectivityResult.none)))) {
    return true;
    // Mobile network available.
  }
  return false;
}

Future<Either<Failure, ResponseModel>> executeImpl<T>(
  Future<ResponseModel> Function() remote, {
  Future<ResponseModel> Function(T data)? localWrite,
  Future<ResponseModel> Function()? localRead,
}) async {
  /// Check if an internet connection is available before proceeding with the request.
  if (await checkConnection()) {
    try {
      /// Execute the provided function and await the result (assumed to be a `ResponseModel`).
      ResponseModel value = await remote.call();

      /// Check the status of the response (`ResponseModel.status`).
      if (value.status.isTrue) {
        /// Successful response (status is true). Extract data using `value.data` and return it as `Right(value.data)`.
        if (localWrite.isNotNull) {
          ResponseModel localResponse = await localWrite!.call(value.data);
          if (localResponse.status.isFalse) {
            return Left(Failure(ResponseCode.CACHE_WRITE_ERROR, ResponseMessage().CACHE_WRITE_ERROR, data: localResponse.data));
          }
        }
        return Right(value);
      } else {
        return Left(Failure(value.code!.toInt, value.message!));
      }
    } catch (error) {
      print(error);

      /// Handle any exceptions that might occur during execution.
      /// Delegate error handling to an `ErrorHandler` instance and return the resulting `Left(Failure)`.
      return Left(ErrorHandler().handle(error));
    }
  } else {
    /// No internet connection detected. Return a `Left` with a pre-defined `Failure` for no internet connection.
    ResponseModel? localResponse;
    if (localRead.isNotNull) {
      localResponse = await localRead!.call();
      if (localResponse.status.isFalse) {
        return Left(
          Failure(ResponseCode.CACHE_READ_ERROR, ResponseMessage().CACHE_READ_ERROR, data: localResponse.data),
        );
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure()..data = localResponse?.data);
  }
}

Future<ResponseModel> remoteExecute({
  /// A required `Future<Response>` object representing the network request.
  required Future<Response> request,

  /// A required function that takes a `Map<String, dynamic>` as input and returns a `ResponseModel` object.
  /// This function is used to process successful response data.
  required ResponseModel Function(dynamic data) fromJsonFunction,
}) async {
  /// Declare a variable to hold the final `ResponseModel` object.
  ResponseModel responseModel;

  /// Await the execution of the provided `request` future to get the response.
  Response response = await request;

  /// Convert the response data to a String for processing.
  String data = response.data.toString();

  /// Handle successful responses (status code 200)
  if (response.statusCode == ResponseCode.SUCCESS) {
    /// Attempt to decode the response data as a JSON map and pass it to the `onSuccess` function
    /// to create the `ResponseModel` object for successful cases.
    dynamic map = jsonDecode(data);
    String? message;
    if(map is Map && map.containsKey('data').isFalse){
      message=map["message"];
      (map).remove('message');
      map={
        'data':map,

        "message":message,
        'success':true
      };
    }else if(map is List){
      map={
        'data':map,
        'success':true
      } as Map;
    }
    try {
      responseModel = fromJsonFunction(map);
      responseModel.code=response.statusCode.toString();
    } catch (error) {
      //the error is from conversion which is done by fromJson method
      responseModel = ResponseModel(
        code: response.statusCode.toString(),
        status: false,
        message: "${error.runtimeType}\n$error",
      );
    }
  } else {
    /// Handle unsuccessful responses (status code other than 200)
    try {
      /// Attempt to decode the response data as a JSON map and use it to create a `ResponseModel`
      /// for error cases (based on `ResponseModel.fromJson` constructor).
      responseModel = ResponseModel.fromJson(jsonDecode(data));
    } on FormatException {
      /// If JSON decoding fails (e.g., invalid format), create a generic error `ResponseModel`.
      responseModel = ResponseModel(code: response.statusCode.toString(), message: data, status: false);
    }
  }

  /// Return the constructed `ResponseModel` object.
  return responseModel;
}
