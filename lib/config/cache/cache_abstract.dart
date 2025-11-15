import 'package:cherubini/exports.dart';
abstract class CacheAbstract {
  SharedPreferences sharedPreferences;
  CacheAbstract({required this.sharedPreferences});
  Future<ResponseModel> cacheRemove({
    required String key,
    Function()? afterRemoving,
  });
  Future<ResponseModel> cacheWrite(String key, dynamic data,
      {Function()? afterCaching, Map<String, dynamic> Function(dynamic data)? toJson});
  Future<ResponseModel> cacheRead<T>(String key, {T Function(Map<String, dynamic>)? fromJson, Function(T)? afterCaching});
}
