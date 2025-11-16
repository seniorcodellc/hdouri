import '../../../../exports.dart';

class HomePresenceButton extends StatelessWidget {
  const HomePresenceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      color: AppColors.presenceButtonColor,
      side: BorderSide(
        color: Color.lerp(AppColors.borderColor, Colors.white, 0.68)!,
        width: 4.w,
      ),
      width: 142.w,
      onPressed: () {
        Routes.attendanceNavButton.moveTo();
      },
      rightIcon: CustomSVGImage(asset: AppAssets.attendance),
      text: AppStrings.presence,
      style: getRegularTextStyle(color: AppColors.white),
    );
  }
}
