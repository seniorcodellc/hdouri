import 'package:cherubini/features/tech_dashborad/data/statics/tech_settings_details_static.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_user_details_list_item.dart';

import '../../../../exports.dart';

class SettingsUserDetailsList extends StatelessWidget {
  const SettingsUserDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        TechSettingsDetailsStatic.techSettingsDetailsList.length,
        (index) {
          final model =
              TechSettingsDetailsStatic.techSettingsDetailsList[index];
          return Padding(
            padding: getPadding(bottom: 16.h),
            child: Container(
              width: 343.w,
              height: 62.h,
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
              child: SettingsUserDetailsListItem(model: model),
            ),
          );
        },
      ),
    );
  }
}
