import '../../../../exports.dart';

class RegisterAcceptMessage extends StatelessWidget {
  const RegisterAcceptMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      // height: 116.h,
      decoration: BoxDecoration(
        color: AppColors.mutedBlue,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: getPadding(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSVGImage(asset: AppAssets.check),
            8.hs,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.acceptMessage1Ar,
                  style: getRegularTextStyle(
                    fontSize: 16,
                    color: AppColors.grayHint,
                  ),
                ),
                Text(
                  AppStrings.acceptMessage2Ar,
                  style: getRegularTextStyle(
                    fontSize: 16,
                    color: AppColors.grayHint,
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
