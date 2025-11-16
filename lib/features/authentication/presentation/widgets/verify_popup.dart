import '../../../../exports.dart';

class VerifyPopup extends StatelessWidget {
  const VerifyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: getPadding(vertical: 30.0.h,horizontal: 16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.confirmTransfer,
              style: getMediumTextStyle(
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
            18.vs,
            Text(
              AppStrings.moveTo,
              style: getRegularTextStyle(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: getPadding(vertical: 35.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.nafazCountry,style: getBoldTextStyle(fontSize: 22.sp,color: AppColors.white),),
                  25.hs,
                  CustomSVGImage(asset: AppAssets.exchange,),
                  25.hs,
                  Text(AppStrings.education,style: getBoldTextStyle(fontSize: 22.sp,color: AppColors.white),),
                ],
              ),
            ),
            Padding(
              padding: getPadding(horizontal:28.0.w),
              child: Text(
                AppStrings.pressMove,
                style: getRegularTextStyle(
                  fontSize: 12.sp,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            18.vs,
            CustomButton(
              text: AppStrings.move,
              onPressed: () {},
              borderRadius: 10.r,
              borderColor: AppColors.white,
              backgroundColor: AppColors.white,
              textColor: AppColors.primaryColor,
            ),
            16.vs,
            CustomButton(
              text: AppStrings.cancel,
              onPressed: () {},
              borderRadius: 10.r,
              borderColor: AppColors.white,
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
