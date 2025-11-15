import '../../../../exports.dart';

class HomeTimerInsideCircle extends StatelessWidget {
  const HomeTimerInsideCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(106.r),
      ),
      child: Column(
        children: [
          35.vs,
          CustomSVGImage(
            asset: AppAssets.clock,
            fit: BoxFit.none,
            color: AppColors.white,
          ),
          10.vs,
          Text(
            AppStrings.timer,
            style: getBoldTextStyle(fontSize: 32, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
