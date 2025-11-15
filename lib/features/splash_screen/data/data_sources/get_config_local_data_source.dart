
import '../../../../exports.dart';
import '../models/config_response_model.dart';

abstract class GetConfigurationLocalDataSource {
  Future< ResponseModel> storeData(ConfigData configData);
  Future< ResponseModel> getData();
  Future<ResponseModel> cacheNew();
  Future<ResponseModel> getNew();
}

class GetConfigurationLocalDataSourceImpl extends GetConfigurationLocalDataSource {
  CacheAbstract cache;
  GetConfigurationLocalDataSourceImpl({required this.cache});

  @override
  Future< ResponseModel> getData() => cache.cacheRead(AppPrefs.configKey, fromJson: ConfigData.fromJson);

  @override
  Future< ResponseModel> storeData(ConfigData configData) =>cache.cacheWrite(AppPrefs.configKey, configData.toJson());
  @override
  Future<ResponseModel> cacheNew() => cache.cacheWrite(AppPrefs.prefsNewInstallKey,false);

  @override
  Future<ResponseModel> getNew() async => cache.cacheRead<bool?>( AppPrefs.prefsNewInstallKey);
}
