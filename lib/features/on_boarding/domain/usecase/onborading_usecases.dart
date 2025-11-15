

import '../../../../exports.dart';
import '../repositories/onboarding_repo.dart';

class OnBoardingUsesCases {
  OnBoardingRepo onBoardingRepo;
  OnBoardingUsesCases({required this.onBoardingRepo});
  Future<Either<Failure, ResponseModel>> cacheNew() => onBoardingRepo.cacheNew();
  Future<Either<Failure, ResponseModel>> getNew() => onBoardingRepo.getNew();
}
