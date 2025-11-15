import '../../../../exports.dart';

class ScanBlueCircle extends StatelessWidget {
  const ScanBlueCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 40.w,
      // height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.mutedBlue,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: getPadding(horizontal: 8, vertical: 8),
        child: CustomSVGImage(asset: AppAssets.scanFilled),
      ),
    );
  }
}
