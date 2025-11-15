import 'package:cherubini/features/tech_dashborad/data/models/tech_settings_model.dart';

import '../../../../exports.dart';

class SettingsUserDetailsListItem extends StatelessWidget {
  const SettingsUserDetailsListItem({super.key, required this.model});
  final TechSettingsModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w, vertical: 11.h),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.mutedBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CustomSVGImage(
              asset: model.asset,
              fit: BoxFit.none,
              color: AppColors.primaryColor,
            ),
          ),
          8.hs,
          Text(
            model.title,
            style: getRegularTextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          CustomSVGImage(asset: AppAssets.arrowLeft, color: AppColors.grayHint),
        ],
      ),
    );
  }
}
