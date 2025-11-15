import '../../../../exports.dart';

class GiftBlueCircle extends StatelessWidget {
  const GiftBlueCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.mutedBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: CustomSVGImage(asset: AppAssets.gift, fit: BoxFit.none),
    );
  }
}
