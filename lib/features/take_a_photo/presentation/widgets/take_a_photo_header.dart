import '../../../../exports.dart';

class TakeAPhotoHeader extends StatelessWidget {
  const TakeAPhotoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Container(
        width: 343.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: getPadding(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.takeAPhotoInstruction,
                style: getRegularTextStyle(color: AppColors.primaryColor),
              ),
              CustomSVGImage(asset: AppAssets.cancel),
            ],
          ),
        ),
      ),
    );
  }
}
