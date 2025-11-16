import '../../../../exports.dart';

class PerformanceBoardSharedIconsContainer extends StatelessWidget {
  const PerformanceBoardSharedIconsContainer({super.key, required this.asset});
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 39.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGray, width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CustomSVGImage(asset: asset, fit: BoxFit.none),
    );
  }
}
