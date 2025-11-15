import '../../../../exports.dart';

class HomeSpecifyYourLocationButton extends StatelessWidget {
  const HomeSpecifyYourLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Routes.specifyYourLocationRoute.moveTo();
      },
      side: BorderSide(
        color: Color.lerp(AppColors.borderColor, Colors.white, 0.68)!,
        width: 4.w,
      ),
      leftIcon: CustomSVGImage(asset: AppAssets.location),
      text: AppStrings.specifyYourLocation,
    );
  }
}
