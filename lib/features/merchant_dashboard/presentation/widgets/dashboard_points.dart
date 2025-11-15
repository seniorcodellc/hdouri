import 'package:hdouri/config/extensions/extensions.dart';
import 'package:hdouri/config/utils/size_utils.dart';
import 'package:hdouri/core/profile/data/models/profile_response_model.dart';
import 'package:hdouri/core/utils/app_colors.dart';
import 'package:hdouri/core/utils/app_style.dart';
import 'package:hdouri/core/widgets/points_item.dart';
import 'package:hdouri/features/merchant_dashboard/data/models/points_model.dart';
import 'package:hdouri/features/merchant_dashboard/presentation/widgets/points_list.dart';
import 'package:hdouri/features/merchant_dashboard/presentation/widgets/quick_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class DashboardPoints extends StatelessWidget {
  final ProfileModel? profile;
  const DashboardPoints({this.profile,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 140.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PointsItem(model: PointsModel(iconPath: AppAssets.loyaltyFilled, title: 'إجمالى النقاط ', number:profile?.totalPoints.validate.toString()),),
          PointsItem(model: PointsModel(iconPath: AppAssets.gift,
              title: ' النقاط المستبدلة ', number:profile?.pointDelevery.validate.toString()),),
       PointsItem(model: PointsModel(iconPath: AppAssets.availablePoints,
              title: ' النقاط المتاحة', number:profile?.balance.validate.toString()),),

         // PointsList(),
        /*  Padding(
            padding: getPadding(horizontal: 16.0.w, vertical: 8.0.h),
            child: Text(
              AppStrings.quickProceduresAr,
              style: getBoldTextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          QuickActionWidget(),
          Padding(
            padding: getPadding(
              start: 16.0.w,
              end: 16.0.w,
              top: 16.0.h,
              bottom: 8.0.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 AppStrings.lastScanOperationsAr,
                  style: getBoldTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  AppStrings.displayAllAr,
                  style: getRegularTextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
