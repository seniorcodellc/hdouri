

import '../../../../exports.dart';

abstract class OnBoardingRepo {
  Future<Either<Failure, ResponseModel>> cacheNew();
  Future<Either<Failure, ResponseModel>> getNew();
}
