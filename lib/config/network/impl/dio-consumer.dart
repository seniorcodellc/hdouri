import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:cherubini/config/extensions/extensions.dart';

import '../../constants/app_constants.dart';
import '../abstract/api_consumer.dart';
import '../constants/endpoinst.dart';
import 'dio_interceptors.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;
  final DioInterceptor dioInterceptor;
  final LogInterceptor logInterceptor;
  DioConsumer({
    required this.client,
    required this.dioInterceptor,
    required this.logInterceptor,
  });

  void dioInit() {
    client.options
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..responseType = ResponseType.plain
      ..headers = {"accept": "application/json"}
      ..receiveDataWhenStatusError = true
      ..sendTimeout = AppConstants.sendTimeOut
      ..connectTimeout = AppConstants.connectTimeOut
      ..receiveTimeout = AppConstants.receiveTimeOut
      ..receiveDataWhenStatusError = true
      ..baseUrl = EndPoints.baseUrl;

    client.interceptors.add(dioInterceptor);
    // we use login interceptor in debug models only
    if (kDebugMode) {
      client.interceptors.add(logInterceptor);
    }
  }

  @override
  Future<Response> getRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    client.options.baseUrl = baseUrl;
    final Response<dynamic> response = await client.get(path, queryParameters: queryParams);
    //debugPrint(response.realUri.toString());
    //   debugPrint(response.data.json);
    //debugPrint(" status code is ${response.statusCode}");
    return response;
  }

  @override
  Future<Response> postRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    client.options.baseUrl = baseUrl;

    if (isFormData.isFalse) {
      Response response = await client.post(
        path,
        queryParameters: queryParams,
        data: body,
      );

      return response;
    } else {
      // Create a FormData object.
      final formData = FormData();

      // Add the body data to the FormData object.
      for (final entry in body!.entries) {
        if ((entry.value is String) &&
            ((entry.value.endsWith('.jpg')) ||
                entry.value.endsWith('.png') ||
                (entry.value.endsWith('.mp4')) ||
                (entry.value.endsWith('.jpeg')) ||
                (entry.value.endsWith('.mp3')))) {
          // Add the file to the FormData object.
          formData.files.add(
            MapEntry(
              entry.key,
              await MultipartFile.fromFile(entry.value as String),
            ),
          );
        } else {
          // Add the other data to the FormData object.
          if (entry.value != null) {
            formData.fields.add(MapEntry(entry.key, entry.value.toString()));
          } else {
            formData.fields.add(MapEntry(entry.key, ''));
          }
        }
      }

      // Send the FormData object.
      final Response response = await client.post(
        path,
        queryParameters: queryParams,
        data: formData,
      );

      return response;
    }
  }

  @override
  Future<Response> putRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    client.options.baseUrl = baseUrl;

    if (isFormData.isFalse) {
      Response response = await client.put(
        path,
        queryParameters: queryParams,
        data: body,
      );
      return response;
    } else {
      // Create a FormData object.
      final formData = FormData();

      // Add the body data to the FormData object.
      for (final entry in body!.entries) {
        if (entry.value is String &&
            ((entry.value.endsWith('.jpg')) ||
                entry.value.endsWith('.png') ||
                (entry.value.endsWith('.mp4')) ||
                (entry.value.endsWith('.jpeg')) ||
                (entry.value.endsWith('.mp3')))) {
          // Add the file to the FormData object.
          formData.files.add(
            MapEntry(
              entry.key,
              await MultipartFile.fromFile(entry.value as String),
            ),
          );
        } else {
          // Add the other data to the FormData object.
          if (entry.value != null) {
            formData.fields.add(MapEntry(entry.key, entry.value.toString()));
          } else {
            formData.fields.add(MapEntry(entry.key, ''));
          }
        }
      }
      // Send the FormData object.
      formData.fields.forEach(
        (element) {
          print("${element.key} ${element.value}");
        },
      );
      formData.files.forEach(
        (element) {
          print("${element.key} ${element.value}");
        },
      );
      final Response response = await client.put(
        path,
        queryParameters: queryParams,
        data: formData,
      );

      return response;
    }
  }

  @override
  Future<Response> deleteRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    client.options.baseUrl = baseUrl;

    Response response = await client.delete(
      path,
      queryParameters: queryParams,
      data: body,
    );

    return response;
  }
}
