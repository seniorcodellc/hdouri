import '../../exports.dart';

class CacheImpl extends CacheAbstract {
  CacheImpl({required super.sharedPreferences});

  Future<ResponseModel> cacheRemove({
    required String key,
    Function()? afterRemoving,
  }) async {
    bool isRemoved = true;
    ResponseModel response = ResponseModel(
        code: ResponseCode.CACHE_REMOVE_SUCCESS.toString(),
        status: true,
        message: ResponseMessage().CACHE_WRITE_SUCCESS.trans,
        data: isRemoved);

    if (sharedPreferences.containsKey(key)) {
      isRemoved = await sharedPreferences.remove(key);
      if (isRemoved.isFalse) {
        response = ResponseModel(
            code: ResponseCode.CACHE_REMOVE_ERROR.toString(),
            status: false,
            message: ResponseMessage().CACHE_WRITE_SUCCESS.trans,
            data: isRemoved);
      }
    }
    if (isRemoved.isTrue) {
      afterRemoving?.call();
    }
    return response;
  }

  Future<ResponseModel> cacheWrite(String key, dynamic data,
      {Function()? afterCaching, Map<String, dynamic> Function(dynamic data)? toJson}) async {
    bool isCached = false;
    ResponseModel response;
    if (toJson.isNotNull) {
      List<Map<String, dynamic>> list = (data as List).map((e) => toJson!(e)).toList();
      isCached = await sharedPreferences.setString(key, list.fromJsonToString);
    } else if (data is Map<String, dynamic>) {
      isCached = await sharedPreferences.setString(key, data.fromJsonToString);
    } else if (data is bool) {
      isCached = await sharedPreferences.setBool(key, data);
    } else if (data is double) {
      isCached = await sharedPreferences.setDouble(key, data);
    } else if (data is int) {
      isCached = await sharedPreferences.setInt(key, data);
    } else if (data is String) {
      isCached = await sharedPreferences.setString(key, data);
    }
    if (isCached.isTrue) {
      afterCaching?.call();
      response = ResponseModel(
          code: ResponseCode.CACHE_WRITE_SUCCESS.toString(),
          status: true,
          message: ResponseMessage().CACHE_WRITE_SUCCESS.trans,
          data: isCached);
    } else {
      response = ResponseModel(
          code: ResponseCode.CACHE_WRITE_ERROR.toString(),
          message: ResponseMessage().CACHE_WRITE_ERROR.trans,
          status: false,
          data: isCached);
    }

    debugPrint('cached $isCached');
    return response;
  }

  Future<ResponseModel> cacheRead<T>(String key, {T Function(Map<String, dynamic>)? fromJson, Function(T)? afterCaching}) async {
    T? saveData;
    ResponseModel responseModel;
    if (sharedPreferences.containsKey(key)) {
      if (fromJson.isNotNull) {
        String? str = sharedPreferences.getString(key);
        if (str.isNotNull) {
          saveData = fromJson!(str!.fromStringToJson);
        }
      } else if (T.toString().contains("bool")) {
        saveData = sharedPreferences.getBool(key) as T;
      } else if (T.toString().contains("double")) {
        saveData = sharedPreferences.getDouble(key) as T;
      } else if (T.toString().contains("int")) {
        saveData = sharedPreferences.getInt(key) as T;
      } else if (T.toString().contains("String")) {
        saveData = sharedPreferences.getString(key) as T;
      }

      if (saveData != null) {
        responseModel = ResponseModel(
          code: ResponseCode.CACHE_READ_SUCCESS.toString(),
          status: true,
          message: ResponseMessage().CACHE_READ_SUCCESS.trans,
          data: saveData,
        );
        if (afterCaching.isNotNull) {
          afterCaching!(saveData);
        }
      } else {
        responseModel = ResponseModel(
          code: ResponseCode.CACHE_READ_ERROR.toString(),
          status: false,
          message: ResponseMessage().CACHE_READ_ERROR.trans,
        );
      }
    } else {
      responseModel = ResponseModel(
        code: ResponseCode.NOT_FOUND_IN_CACHE.toString(),
        status: true,
        message: ResponseMessage().NOT_FOUND_IN_CACHE.trans,
      );
      return responseModel;
    }
    return responseModel;
  }


}
