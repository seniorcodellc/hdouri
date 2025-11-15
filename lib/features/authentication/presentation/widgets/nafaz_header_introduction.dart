import '../../../../exports.dart';

class NafazHeaderIntroduction extends StatelessWidget {
  const NafazHeaderIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
        color: AppColors.lighterGrey,
        border: Border(
          bottom: BorderSide(
            color: AppColors.dots
          )
        )
      ),
      child: Padding(
        padding: getPadding(top: 25.0.h,bottom: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.nafaz,style: getBoldTextStyle(fontSize: 28.sp,color: AppColors.primaryColor),),
            20.vs,
            Text(AppStrings.nafazNation,style: getBoldTextStyle(fontSize: 16.sp,color: AppColors.darkGray),),
            20.vs,
            Text(AppStrings.welcomeNafaz,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.darkGray),),
          ],
        ),
      ),
    );
  }
}
