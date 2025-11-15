import 'package:hdouri/exports.dart';
import 'package:hdouri/exports.dart';
import '../models/onboarding_model.dart';
class OnboardingStatics {
  static List<OnboardingModel> onBoardingItems = [
    OnboardingModel(
      imagePath: AppAssets.onboarding1,
      title: AppStrings.onBoarding1Title,
      subTitle: AppStrings.onBoarding1SubTitle,
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding2,
      title: AppStrings.onBoarding2Title,
      subTitle: AppStrings.onBoarding2SubTitle,
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding3,
      title: AppStrings.onBoarding3Title,
      subTitle: AppStrings.onBoarding3SubTitle,
    ),
  ];
}

