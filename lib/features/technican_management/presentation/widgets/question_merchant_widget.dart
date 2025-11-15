import 'package:cherubini/exports.dart';

class QuestionMerchantWidget extends StatelessWidget {
  const QuestionMerchantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 311.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2.r,
            blurRadius: 5.r,
            offset: Offset(0, 2.h),
          ),
        ],

      ),
      child: Padding(
        padding: getPadding(vertical: 12.0.h,horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomSVGImage(asset: AppAssets.questionMark,color: AppColors.primaryColor,),
                8.hs,
                Text(AppStrings.techQuestion,style: getRegularTextStyle(fontSize: 12.sp,color: AppColors.primaryColor),),
              ],
            ),
            4.vs,
            Text(AppStrings.techQuestionAnswer,style: getRegularTextStyle(fontSize: 12.sp,color: AppColors.grayHint),),
          ],
        ),
      ),
    );
  }
}
