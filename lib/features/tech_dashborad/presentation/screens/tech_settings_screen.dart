import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_header.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_log_out.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_notifications_list.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_user_details_list.dart';

import '../../../../exports.dart';

class TechSettingsScreen extends StatelessWidget {
  const TechSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.vs,
                SettingsHeader(title: AppStrings.techDescriptionAr,),
                24.vs,
                SettingsUserDetailsList(),
                24.vs,
                Padding(
                  padding: getPadding(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.notificationsAr,
                      style: getBoldTextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                16.vs,
                SettingsNotificationsList(),
                24.vs,
                SettingsLogOut(),
                30.vs,
              ],
            ),
          ),
        ],
      ),
    );
  }
}