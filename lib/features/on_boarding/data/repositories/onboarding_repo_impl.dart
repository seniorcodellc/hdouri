
import '../../domain/repositories/onboarding_repo.dart';
import '../data_sources/onboarding_local_data_source.dart';
import 'package:cherubini/exports.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  OnBoardingLocalDataSource onBoardingLocalDataSource;
  OnBoardingRepoImpl({required this.onBoardingLocalDataSource});

  @override
  Future<Either<Failure, ResponseModel>> cacheNew() => executeCache(() => onBoardingLocalDataSource.cacheNew());

  @override
  Future<Either<Failure, ResponseModel>> getNew() => executeCache(() async => await onBoardingLocalDataSource.getNew());
}
