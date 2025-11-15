

import '../../../../exports.dart';

abstract class GetConfigRepo {
  Future<Either<Failure, ResponseModel>> getConfig();
  Future<Either<Failure, ResponseModel>> cacheNew();
  Future<Either<Failure, ResponseModel>> getNew();
}
