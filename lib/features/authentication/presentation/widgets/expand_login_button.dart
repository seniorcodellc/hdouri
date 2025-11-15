// expandable_login_options.dart
import '../../../../exports.dart';

class ExpandLoginButton extends StatefulWidget {
  const ExpandLoginButton({super.key});

  @override
  State<ExpandLoginButton> createState() => _ExpandLoginButtonsState();
}

class _ExpandLoginButtonsState extends State<ExpandLoginButton> {
  bool _isExpanded = false;

  void _toggle() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: AppStrings.enterAccount,
          onPressed: _toggle,
          backgroundColor: AppColors.primaryColor,
          borderColor: AppColors.primaryColor,
          borderRadius: 10.r,
          svgIconPath: _isExpanded ? AppAssets.minus : AppAssets.add,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: SizedBox(
            height: _isExpanded ? null : 0,
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
                        ),
                        16.vs,
                        CustomButton(
                          text: AppStrings.nafazLogin,
                          onPressed: () {},
                          backgroundColor: AppColors.bgColor,
                          borderColor: AppColors.primaryColor,
                          borderRadius: 10.r,
                        ),
                        16.vs,
                        CustomButton(
                          text: AppStrings.emailLogin,
                          onPressed: () {},
                          backgroundColor: AppColors.bgColor,
                          borderColor: AppColors.primaryColor,
                          borderRadius: 10.r,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
