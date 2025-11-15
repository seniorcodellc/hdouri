import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hdouri/config/extensions/extensions.dart';

import '../../../config/constants/app_prefs.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers[HttpHeaders.contentTypeHeader] = ContentType.json;
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('REQUEST[${options.method}] => PATH: ${options.data.toString()}');
    options.headers[HttpHeaders.acceptLanguageHeader] = AppPrefs.language;

    if (AppPrefs.token.isNotNull) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer ${AppPrefs.token}";
    } else {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMjM0NTY3ODkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxOCIsIm5hbWVpZCI6IjM2IiwibmJmIjoxNjE4MzYxNzE2LCJleHAiOjE2MTgzNjUzMTYsImlhdCI6MTYxODM2MTcxNn0.6CoT_TtppQ0agFJsO7qeJYcyOdlyeXl6-u42cdLhDT0";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
