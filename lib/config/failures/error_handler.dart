
import 'package:cherubini/exports.dart';


class ErrorHandler implements Exception {
  ErrorHandler._internal();
  factory ErrorHandler() => ErrorHandler._internal();
  Failure handle(dynamic error) {
    Failure failure;
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }

    return failure;
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.INVALIDINPUT:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();
              return Failure(ResponseCode.INVALIDINPUT, message);
            }

            return DataSource.INVALIDINPUT.getFailure();

          case ResponseCode.BAD_REQUEST:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();

              return Failure(ResponseCode.BAD_REQUEST, message);
            } else {
              return DataSource.BAD_REQUEST.getFailure();
            }

          case ResponseCode.SERVER_ERROR:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();

              return Failure(ResponseCode.BAD_REQUEST, message);
            } else {
              return DataSource.SERVER_ERROR.getFailure();
            }
          case ResponseCode.FORBIDDEN:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();

              return Failure(ResponseCode.BAD_REQUEST, message);
            } else {
              return DataSource.FORBIDDEN.getFailure();
            }
          case ResponseCode.UNAUTHORISED:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();

              return Failure(ResponseCode.BAD_REQUEST, message);
            } else {
              return DataSource.UNAUTHORISED.getFailure();
            }
          case ResponseCode.NOT_FOUND:
            if (error.response!.data.toString().contains("message")) {
              String message = (jsonDecode(error.response!.data)["message"]).toString();

              return Failure(ResponseCode.BAD_REQUEST, message);
            } else {
              return DataSource.NOT_FOUND.getFailure();
            }
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE_ERROR.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.CONNECTION_ERROR.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage().BAD_REQUEST.trans);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage().FORBIDDEN.trans);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage().UNAUTHORISED.trans);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage().NOT_FOUND.trans);
      case DataSource.SERVER_ERROR:
        return Failure(ResponseCode.SERVER_ERROR, ResponseMessage().SERVER_ERROR.trans);
      case DataSource.INVALIDINPUT:
        return Failure(ResponseCode.INVALIDINPUT, ResponseMessage().INVALID_INPUT_ERROR.trans);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage().CONNECT_TIMEOUT.trans);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage().CANCEL.trans);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage().RECEIVE_TIMEOUT.trans);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage().SEND_TIMEOUT.trans);
      case DataSource.CACHE_WRITE_ERROR:
        return Failure(ResponseCode.CACHE_READ_ERROR, ResponseMessage().CACHE_WRITE_ERROR.trans);
      case DataSource.CACHE_READ_ERROR:
        return Failure(ResponseCode.CACHE_READ_ERROR, ResponseMessage().CACHE_READ_ERROR.trans);
      case DataSource.CACHE_REMOVE_ERROR:
        return Failure(ResponseCode.CACHE_REMOVE_ERROR, ResponseMessage().CACHE_REMOVE_ERROR.trans);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage().NO_INTERNET_CONNECTION.trans);
      case DataSource.BAD_CERTIFICATE_ERROR:
        return Failure(ResponseCode.BAD_CERTIFICATION_ERROR, ResponseMessage().CERTIFICATION_ERROR.trans);
      case DataSource.CONNECTION_ERROR:
        return Failure(ResponseCode.CONNECTION_ERROR, ResponseMessage().CONNECTION_ERROR.trans);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage().DEFAULT.trans);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage().DEFAULT.trans);
    }
  }
}
