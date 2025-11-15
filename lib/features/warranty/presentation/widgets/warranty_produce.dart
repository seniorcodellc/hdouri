import 'package:cherubini/exports.dart';

class WarrantyProduce extends StatelessWidget {
  const WarrantyProduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mutedBlue,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 2.r,
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: getPadding(vertical: 14.0.h, horizontal: 16.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(top: 8.0.h),
              child: CustomSVGImage(asset: AppAssets.info),
            ),
            6.hs,
            Text(
              AppStrings.publishWarrantyMessage,
              style: getRegularTextStyle(
                fontSize: 12.sp,
                color: AppColors.subTitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
