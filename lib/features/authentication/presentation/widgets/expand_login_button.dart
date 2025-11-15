// expandable_login_options.dart
import '../../../../exports.dart';

class ExpandLoginButton extends StatefulWidget {
  const ExpandLoginButton({super.key});

  @override
  State<ExpandLoginButton> createState() => _ExpandLoginButtonsState();
}

class _ExpandLoginButtonsState extends State<ExpandLoginButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: AppStrings.enterAccount,
          onPressed: (){setState(() => _isExpanded = !_isExpanded);},
          backgroundColor: AppColors.primaryColor,
          borderColor: AppColors.primaryColor,
          borderRadius: 10.r,
          svgIconPath: _isExpanded ? AppAssets.minus : AppAssets.add,
        ),
        16.vs,
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: getPadding(horizontal: 16.0.w),
                  child: Column(
                    children: [
                      CustomButton(
                        text: AppStrings.oneLogin,
                        onPressed: () {},
                        backgroundColor: AppColors.bgColor,
                        borderColor: AppColors.primaryColor,
                        borderRadius: 10.r,
                        textColor: AppColors.primaryColor,
                      ),
                      16.vs,
                      CustomButton(
                        text: AppStrings.nafazLogin,
                        onPressed: () {Routes.loginNafazRoute.moveTo();},
                        backgroundColor: AppColors.bgColor,
                        borderColor: AppColors.primaryColor,
                        borderRadius: 10.r,
                        textColor: AppColors.primaryColor,
                      ),
                      16.vs,
                      CustomButton(
                        text: AppStrings.emailLogin,
                        onPressed: () {Routes.loginEmailRoute.moveTo();},
                        backgroundColor: AppColors.bgColor,
                        borderColor: AppColors.primaryColor,
                        borderRadius: 10.r,
                        style:getMediumTextStyle(fontSize: 15,color: AppColors.primaryColor),
                      ),
                      24.vs,

                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
