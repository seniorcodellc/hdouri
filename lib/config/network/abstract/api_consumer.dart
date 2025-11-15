import '../constants/endpoinst.dart';

abstract class ApiConsumer {
  Future getRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? queryParams,
  });
  Future postRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  });
  Future putRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  });
  Future deleteRequest(
      {String baseUrl = EndPoints.baseUrl, required String path, Map<String, dynamic>? body, Map<String, dynamic>? queryParams});
}
