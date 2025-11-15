import 'package:cherubini/exports.dart';
import '../../../../exports.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
    required this.currentPage,
  });
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 28.h),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
                (index) => Container(
              margin: getMargin(horizontal: 6.0.w),
              width:index == currentPage ? 30.w: 10.w,
              height: 10.w,
              decoration: ShapeDecoration(
                color: index == currentPage ? AppColors.primaryColor : AppColors.dots,
                shape:index == currentPage ?RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)
                ): CircleBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}