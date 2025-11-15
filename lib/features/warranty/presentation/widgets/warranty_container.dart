import 'package:cherubini/exports.dart';

class CreateWarrantyContainer extends StatelessWidget {
  const CreateWarrantyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2.r,
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: getPadding(vertical: 14.0.h, start: 14.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(top: 5.0.h),
              child: Directionality(textDirection: TextDirection.ltr,
              child: CustomSVGImage(asset: AppAssets.warranty)),
            ),
            5.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.createWarranty,
                    style: getRegularTextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.vs,
                  Text(
                    AppStrings.addProductWarrantyMessage,
                    style: getRegularTextStyle(
                      fontSize: 13.sp,
                      color: AppColors.subTitleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}