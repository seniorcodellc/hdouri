import 'package:cherubini/exports.dart';
@protected
abstract class RequestsAbstract {
  Future<ResponseModel> getRequest({
    required String endPoint,
    required ResponseModel Function( dynamic data) getFromJsonFunction,
    dynamic query,
  });

  Future<ResponseModel> postRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
    bool isFormData = false,
    required Map<String, dynamic>? data,
  });

  Future<ResponseModel> updateRequest({
    required String endPoint,
    bool isFormData = false,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
    required dynamic data,
  });

  Future<ResponseModel> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
  });
}

@protected
abstract class RequestsImpl extends RequestsAbstract {
  final DioConsumer dioConsumer;
  RequestsImpl({required this.dioConsumer});

  @override
  Future<ResponseModel> getRequest({
    required String endPoint,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
    dynamic query,
  }) => remoteExecute(
    request: dioConsumer.getRequest(path: endPoint, queryParams: query is Map ? query : query?.toJson()),
    fromJsonFunction: getFromJsonFunction,
  );

  @override
  Future<ResponseModel> postRequest({
    required String endPoint,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
    bool isFormData = false,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) => remoteExecute(
    request: dioConsumer.postRequest(path: endPoint, body: data, isFormData: isFormData, queryParams: queryParams),
    fromJsonFunction: getFromJsonFunction,
  );

  @override
  Future<ResponseModel> updateRequest({
    required String endPoint,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
    bool isFormData = false,
    required data,
  }) => remoteExecute(
    request: dioConsumer.postRequest(path: endPoint, body: data, isFormData: isFormData),
    fromJsonFunction: getFromJsonFunction,
  );

  @override
  Future<ResponseModel> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(dynamic data) getFromJsonFunction,
  }) => remoteExecute(
    request: dioConsumer.deleteRequest(path: endPoint, queryParams: queryParams),
    fromJsonFunction: getFromJsonFunction,
  );
}
