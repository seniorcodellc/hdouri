import 'package:hdouri/exports.dart';

class ShowDetailsButton extends StatelessWidget {
  const ShowDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0.r),
          border: Border.all(color:AppColors.mutedBlue)
      ),
      child: Padding(
        padding: getPadding(horizontal: 4.0.w,vertical: 2.0.h),
        child: Text(AppStrings.showDetails,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.primaryColor),),
      ),
    );
  }
}
