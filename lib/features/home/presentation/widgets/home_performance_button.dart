import '../../../../exports.dart';

class HomePerformanceButton extends StatelessWidget {
  const HomePerformanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 114.w,
      height: 34.h,
      color: AppColors.white,
      onPressed: () {},
      side: const BorderSide(color: AppColors.borderColor, width: 1),
      text: AppStrings.performanceBoard,
      style: getRegularTextStyle(color: AppColors.borderColor),
    );
  }
}
