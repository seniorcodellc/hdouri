

import '../../../../exports.dart';
import '../model/response_model/login_response_model.dart';

abstract class AuthLocalDataSource {
  Future<ResponseModel> cacheUser({required UserModel user});
  Future<ResponseModel> getUser();
  Future<ResponseModel> clearUser();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  CacheAbstract cache;
  AuthLocalDataSourceImpl({required this.cache});

  @override
  Future<ResponseModel> cacheUser({required UserModel user}) =>
      cache.cacheWrite( AppPrefs.prefsUserKey, user.toJson(), afterCaching: () {
         AppPrefs.user = user;
       AppPrefs.token = user.token;
      });

  @override
  Future<ResponseModel> getUser() =>
      cache.cacheRead<UserModel>( AppPrefs.prefsUserKey, fromJson: UserModel.fromJson,
          afterCaching: (UserModel data) {
        AppPrefs.user = data;
       AppPrefs.token = data.token;
      });

  @override
  Future<ResponseModel> clearUser() => cache.cacheRemove(
        key: AppPrefs.prefsUserKey,
        afterRemoving: () {
          AppPrefs.user = null;
          AppPrefs.token = null;
        },
      );
}
