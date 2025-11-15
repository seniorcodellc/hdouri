import 'package:hdouri/exports.dart';
import 'package:hive/hive.dart';
import '../../features/merchant_dashboard/data/models/points_model.dart';

class PointsItem extends StatelessWidget {
  const PointsItem({super.key, required this.model});
  final PointsModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.0.w, vertical: 10.0.h),
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
          padding: getPadding(vertical: 7.0.h, horizontal: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.mutedBlue,
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
                child: Padding(
                  padding: getPadding(all: 12.0),
                  child: CustomSVGImage(
                    asset: model.iconPath,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              54.hs,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.title,
                    style: getRegularTextStyle(
                      fontSize: 16.sp,
                      color: AppColors.subTitleColor,
                    ),
                  ),

                  model.number.isNotNull?     Text(
                    model.number!,
                    style: getRegularTextStyle(
                      fontSize: 20.sp,
                      color: AppColors.secondaryColor,
                    ),
                  ):Padding(
                    padding: getPadding(bottom: 5.h),
                    child: SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: CircularProgressIndicator(color: AppColors.gradientColorStart,
                      ),
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
