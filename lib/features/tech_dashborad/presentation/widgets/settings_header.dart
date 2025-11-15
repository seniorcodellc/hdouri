import '../../../../exports.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key, required this.title});
final String title ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Container(
        width: 343.w,
        height: 80.h,
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
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 0.r,
              blurRadius: 2.r,
              offset: Offset(0, 1.h),
            ),
          ],
        ),
        child: Padding(
          padding: getPadding(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56.r),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColorStart,
                      AppColors.gradientColorEnd,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomSVGImage(
                  asset: AppAssets.profile,
                  fit: BoxFit.none,
                  color: AppColors.white,
                ),
              ),
              16.hs,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.techNameAr,
                    style: getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    title,
                    style: getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.subTitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
