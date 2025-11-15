import 'package:shared_preferences/shared_preferences.dart';

import 'package:cherubini/exports.dart';
import '../../../../config/constants/app_prefs.dart';

abstract class OnBoardingLocalDataSource {
  Future<ResponseModel> cacheNew();
  Future<ResponseModel> getNew();
}

class OnBoardingLocalDataSourceImplWithPrefs extends OnBoardingLocalDataSource {
  CacheAbstract cache;
  OnBoardingLocalDataSourceImplWithPrefs({required this.cache});
  @override
  Future<ResponseModel> cacheNew() => cache.cacheWrite(AppPrefs.prefsNewInstallKey,false);

  @override
  Future<ResponseModel> getNew() async => cache.cacheRead<bool?>( AppPrefs.prefsNewInstallKey);
}
