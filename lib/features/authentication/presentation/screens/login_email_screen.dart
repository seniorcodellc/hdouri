import 'package:hdouri/core/widgets/custom_appbar.dart';
import 'package:hdouri/features/authentication/presentation/widgets/email_text_field.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/password_text_field.dart';

class LoginEmailScreen extends StatelessWidget {
  LoginEmailScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      showAppbar: true,
      appBar: CustomAppbar(title: AppStrings.login),
      child: CustomScrollView(
        slivers:[
          SliverToBoxAdapter(
            child: Padding(
            padding: getPadding(horizontal: 16.0.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  40.vs,
                  EmailTextField(controller: emailController),
                  24.vs,
                  PasswordTextField(controller: passwordController,),
                  85.vs,
                  CustomButton(
                    text: AppStrings.login,
                    onPressed: () {
                      checkStringError(context, emailController.text, Errors.EMAIL_ERROR,);
                      checkStringError(context, passwordController.text, Errors.PASSWORD_ERROR,);
                      if (dontHaveErrors(context)) {}
                    },
                    backgroundColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 10.r,
                    svgIconPath: AppAssets.login,
                  ),
                ],
              ),
            ),
          ),
          )
        ]
      ),
    );
  }
}