import 'package:hdouri/exports.dart';
import 'package:hdouri/exports.dart';
import 'package:hdouri/features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                await context.read<OnboardingManagerCubit>().cachedNewInstall();
              },
              child: Text(
                'تخطي',
                style: getRegularTextStyle(fontSize: 16.sp, color: AppColors.subTitleColor),
              ),
            ),
            CustomButton(text: text, svgIconPath: AppAssets.arrowLeft, onPressed: onTap, height: 50.0.h),
          ],
        ),
      ],
    );
  }
}
