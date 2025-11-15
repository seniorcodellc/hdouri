
import 'package:hdouri/exports.dart';

import '../repositories/get_config_repo.dart';

class GetConfigUseCase {
  final GetConfigRepo getConfigRepo;
  GetConfigUseCase({required this.getConfigRepo});
  Future<Either<Failure, ResponseModel>> getConfig() => getConfigRepo.getConfig();
  Future<Either<Failure, ResponseModel>> cacheNew() => getConfigRepo.cacheNew();
  Future<Either<Failure, ResponseModel>> getNew() => getConfigRepo.getNew();
}
