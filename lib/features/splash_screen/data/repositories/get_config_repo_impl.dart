
import 'package:cherubini/exports.dart';

import '../../domain/repositories/get_config_repo.dart';
import '../data_sources/get_config_local_data_source.dart';
import '../data_sources/get_config_remote_data_source.dart';
import '../models/config_response_model.dart';

class GetConfigRepoImpl extends GetConfigRepo {
  final GetConfigRemoteDataSource getConfigRemoteDataSource;
  final GetConfigurationLocalDataSource getConfigLocalDataSource;
  GetConfigRepoImpl({required this.getConfigRemoteDataSource, required this.getConfigLocalDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getConfig() => executeImpl<ConfigData>(
        () => getConfigRemoteDataSource.getConfig(),
        localRead: () => getConfigLocalDataSource.getData(),
        localWrite: (data) => getConfigLocalDataSource.storeData(data),
      );
  @override
  Future<Either<Failure, ResponseModel>> cacheNew() => executeCache(() => getConfigLocalDataSource.cacheNew());

  @override
  Future<Either<Failure, ResponseModel>> getNew() => executeCache(() async => await getConfigLocalDataSource.getNew());
}
