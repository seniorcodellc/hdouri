import 'package:hdouri/features/home/presentation/widgets/home_timer_inside_circle.dart';

import '../../../../exports.dart';

class HomeTimer extends StatelessWidget {
  const HomeTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 212.w,
          height: 212.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(106.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(4.w, 0.h),
                blurRadius: 4.r,
                spreadRadius: 0.r,
                color: AppColors.black.withOpacity(0.25),
              ),
              BoxShadow(
                offset: Offset(0.w, 4.h),
                blurRadius: 4.r,
                spreadRadius: 0.r,
                color: AppColors.black.withOpacity(0.25),
              ),
            ],
          ),
        ),
        Padding(
          padding: getPadding(top: 20.h, start: 20.w),
          child: HomeTimerInsideCircle(),
        ),
      ],
    );
  }
}
