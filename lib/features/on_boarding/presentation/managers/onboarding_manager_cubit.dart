import 'package:bloc/bloc.dart';
import '../../domain/usecase/onborading_usecases.dart';
import 'package:cherubini/exports.dart';

class OnboardingManagerCubit extends Cubit {
  OnBoardingUsesCases onBoardingUsesCases;
  OnboardingManagerCubit({required this.onBoardingUsesCases}) : super(Null);
  Future<bool> isNewInstalled() async => (await managerExecute<bool?>(onBoardingUsesCases.getNew())).orTrue;

  Future<bool> cachedNewInstall() async => (await managerExecute<bool?>(onBoardingUsesCases.cacheNew(), onSuccess: (data) {
        Routes.loginRoute.moveTo();
      }))
          .orFalse;
}
