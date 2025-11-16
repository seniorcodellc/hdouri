import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/expand_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.0.w),
        child: Column(
          children: [
            80.vs,
            CustomPngImage(image: AppAssets.logo),
            130.vs,
            ExpandLoginButton(),
            CustomButton(
              text: AppStrings.support,
              onPressed: () {
                Routes.homeRoute.moveTo();
              },
              backgroundColor: AppColors.secondColor,
              borderColor: AppColors.secondColor,
              borderRadius: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}
