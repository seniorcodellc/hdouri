import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/expand_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.0.w),
        child: Column(
          children: [
            CustomPngImage(image: AppAssets.logo),
            100.vs,
            ExpandLoginButton(),
            24.vs,
            CustomButton(
              text: 'الدعم الفني',
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
