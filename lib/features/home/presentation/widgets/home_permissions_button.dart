import '../../../../exports.dart';

class HomePermissionsButton extends StatelessWidget {
  const HomePermissionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {},
      side: BorderSide(
        color: Color.lerp(AppColors.borderColor, Colors.white, 0.68)!,
        width: 4.w,
      ),
      leftIcon: CustomSVGImage(asset: AppAssets.clockCircle),
      text: AppStrings.permissions,
    );
  }
}
