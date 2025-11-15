import '../../../../exports.dart';

class SettingsGrayCircle extends StatelessWidget {
  const SettingsGrayCircle({super.key, required this.onTap});

  final GestureTapCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: CustomSVGImage(asset: AppAssets.settings, fit: BoxFit.none),
        ),
      ),
    );
  }
}
