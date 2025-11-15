import 'package:cherubini/exports.dart';
import 'package:cherubini/features/warranty/presentation/widgets/warranty_custom_text_field.dart';

class ClientDetails extends StatelessWidget {
  const ClientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بيانات العميل',
          style: getBoldTextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),
        ),
        16.vs,
        Container(
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
            padding: getPadding(horizontal: 16.0.w,vertical: 8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.clientName,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.primaryColor),),
                 WarrantyCustomTextField(hint: AppStrings.enterClientName),
                Text(AppStrings.phoneNumAr,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.primaryColor),),
                 WarrantyCustomTextField(hint: AppStrings.phoneNumHintAr),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
