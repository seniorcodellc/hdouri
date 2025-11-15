import '../../../../exports.dart';

class SignUpTraderInstruction extends StatelessWidget {
  const SignUpTraderInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppStrings.merchantInstruction1Ar,
              style: getRegularTextStyle(color: AppColors.subTitleColor),
            ),
          ),
          Text(
            AppStrings.merchantInstruction2Ar,
            style: getRegularTextStyle(color: AppColors.subTitleColor),
          ),
        ],
      ),
    );
  }
}
