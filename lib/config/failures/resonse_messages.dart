import 'package:hdouri/config/extensions/extensions.dart';
import 'package:hdouri/core/utils/app_strings.dart';

class ResponseMessage {
  ResponseMessage._internal();

  static final ResponseMessage _instance = ResponseMessage._internal();
  factory ResponseMessage() => _instance;
  // API status codes
  // API response codes
  final String SUCCESS = AppStrings.success.trans; // success with data
  final String NO_CONTENT = AppStrings.noContent.trans; // success with no content
  final String BAD_REQUEST = AppStrings.badRequestError.trans; // failure, network rejected our request
  final String FORBIDDEN = AppStrings.forbiddenError.trans; // failure,  network rejected our request
  final String UNAUTHORISED = AppStrings.unauthorizedError.trans; // failure, user is not authorised
  final String SERVER_ERROR = AppStrings.serverError.trans; // failure, API url is not correct and not found in network side.
  final String NOT_FOUND = AppStrings.notFoundError.trans; // failure, API url is not correct and not found in network side.

  // local responses codes
  final String DEFAULT = AppStrings.defaultError.trans; // unknown error happened
  final String CONNECT_TIMEOUT = AppStrings.connectTimeOutError.trans; // issue in connectivity
  final String CANCEL = AppStrings.defaultError.trans; // API request was cancelled
  final String RECEIVE_TIMEOUT = AppStrings.connectTimeOutError.trans; //  issue in connectivity
  final String SEND_TIMEOUT = AppStrings.connectTimeOutError.trans; //  issue in connectivity
  final String CERTIFICATION_ERROR = AppStrings.certificationError.trans; //  issue in connectivity
  final String CACHE_WRITE_ERROR = AppStrings.cacheWriteError.trans; //  issue in getting data from local data source (cache)
  final String CACHE_WRITE_SUCCESS = AppStrings.cacheWriteSuccess.trans; //  issue in getting data from local data source (cache)
  final String CACHE_READ_ERROR = AppStrings.cacheReadError.trans; //  issue in getting data from local data source (cache)
  final String CACHE_REMOVE_ERROR = AppStrings.cacheRemoveError.trans; //  issue in getting data from local data source (cache)
  final String NO_INTERNET_CONNECTION = AppStrings.noInternetError.trans;

  final String CONNECTION_ERROR = AppStrings.connectionError.trans;

  final String NOT_FOUND_IN_CACHE = AppStrings.notFoundInCache.trans;

  final String CACHE_READ_SUCCESS = AppStrings.cacheReadSuccess.trans;

  final String INVALID_INPUT_ERROR=AppStrings.invalidInputError.trans; // issue in connectivity
}
