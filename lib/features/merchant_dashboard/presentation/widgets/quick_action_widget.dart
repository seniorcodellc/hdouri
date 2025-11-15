import 'package:hdouri/exports.dart';
import '../../data/statics/statics.dart';

class QuickActionWidget extends StatelessWidget {
  const QuickActionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: getPadding(horizontal: 16.0.w, vertical: 8.0.h),
          child: Text(
            AppStrings.quickProceduresAr,
            style: getBoldTextStyle(
              fontSize: 14.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 135.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: getPadding(horizontal: 8.w),
            itemCount: DashboardStatics.actionsList.length,
            separatorBuilder: (context, index) => 10.hs,
            itemBuilder: (context, index) {
              final model = DashboardStatics.actionsList[index];
              return GestureDetector(
                onTap: model.onTap,
                child: Container(
                  height: 138.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: getPadding(horizontal: 10.0.w, vertical: 10.0.h),
                    child: Column(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0.r),
                            gradient: LinearGradient(
                              colors: [Color(0xff0F50AA), Color(0xff3495E9)],
                              begin: AlignmentGeometry.bottomLeft,
                              end: AlignmentGeometry.topRight,
                            ),
                          ),
                          child: Padding(
                            padding: getPadding(all: 12.0),
                            child: CustomSVGImage(asset: model.iconPath),
                          ),
                        ),
                        10.vs,
                        Text(
                          model.title,
                          style: getRegularTextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryColor,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
