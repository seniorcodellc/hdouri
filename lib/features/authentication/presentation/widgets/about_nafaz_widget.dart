import '../../../../exports.dart';

class AboutNafazWidget extends StatelessWidget {
  const AboutNafazWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
        color: AppColors.lighterGrey,
        border: Border(bottom: BorderSide(color: AppColors.dots)),
      ),
      child: Padding(
        padding: getPadding(top: 30.0.h, bottom: 60.h, horizontal: 20.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  AppStrings.aboutNafaz,
                  style: getMediumTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.darkGray,
                    decoration: TextDecoration.underline,
                  ),
                ),
                24.vs,
                Text(
                  AppStrings.termsAndConditionsNafaz,
                  style: getMediumTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.darkGray,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),   Column(
              children: [
                Text(
                  AppStrings.connectUs,
                  style: getMediumTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.darkGray,
                    decoration: TextDecoration.underline,
                  ),
                ),
                24.vs,
                Text(
                  AppStrings.support,
                  style: getMediumTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.darkGray,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
