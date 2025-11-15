import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';
import 'package:hdouri/features/on_boarding/presentation/widgets/onboarding_buttons.dart';
import '../../../../exports.dart';
import '../../data/static/static.dart';
import '../widgets/onboarding_dots.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() async {
    if (currentPage < OnboardingStatics.onBoardingItems.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    } else {
      await context.read<OnboardingManagerCubit>().cachedNewInstall();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemCount: OnboardingStatics.onBoardingItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: getPadding(horizontal: 16.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                180.vs,
                CustomPngImage(image: OnboardingStatics.onBoardingItems[index].imagePath),
                35.vs,
                Text(
                  OnboardingStatics.onBoardingItems[index].title,
                  style: getSemiBoldTextStyle(fontSize: 24.sp, color: AppColors.primaryColor),
                ),
                10.vs,
                Padding(
                  padding: getPadding(horizontal: 30.0),
                  child: Text(
                    OnboardingStatics.onBoardingItems[index].subTitle,
                    textAlign: TextAlign.center,
                    style: getRegularTextStyle(fontSize: 14.sp, color: AppColors.subTitleColor),
                  ),
                ),
                10.vs,
                OnboardingDots(currentPage: currentPage),
                100.vs,
                OnboardingButtons(
                  onTap: () {
                    nextPage();
                  },
                  text: currentPage == OnboardingStatics.onBoardingItems.length - 1 ? 'ابدأ الآن ' : 'التالي',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
