import '../../../../exports.dart';

class HomePerformanceBoardButton extends StatelessWidget {
  const HomePerformanceBoardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 114.w,
      height: 34.h,
      color: AppColors.white,
      onPressed: () {
        Routes.performerBoardRoute.moveTo();
      },
      side: const BorderSide(color: AppColors.borderColor, width: 1),
      text: AppStrings.performanceBoard,
      style: getRegularTextStyle(color: AppColors.borderColor),
    );
  }
}
