// lib/features/warranty/presentation/widgets/custom_product_details_warranty.dart
import 'package:hdouri/exports.dart';
import 'package:hdouri/features/warranty/presentation/widgets/warranty_custom_text_field.dart';

class CustomProductDetailsWarranty extends StatelessWidget {
  final int index;
  final bool showDelete;
  final VoidCallback? onDelete;
  final bool isMerchant;
  const CustomProductDetailsWarranty({
    super.key,
    required this.index,
    required this.showDelete,
    this.onDelete,
    required this.isMerchant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
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
        padding: getPadding(horizontal: 16.0.w),
        child: Column(
          children: [
            Padding(
              padding: getPadding(top: 16.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                        child: Center(
                          child: Text(
                            '$index',
                            style: getRegularTextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      4.hs,
                      Text(
                       AppStrings.product,
                        style: getRegularTextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  if (showDelete)
                    GestureDetector(
                      onTap: onDelete,
                      child: CustomSVGImage(asset: AppAssets.delete),
                    ),
                ],
              ),
            ),
            const WarrantyCustomTextField(hint: AppStrings.serialNumber),
            const WarrantyCustomTextField(hint: AppStrings.productName),
            isMerchant? const WarrantyCustomTextField(hint: AppStrings.readDate): 0.vs,
            8.vs,
          ],
        ),
      ),
    );
  }
}