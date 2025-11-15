import 'package:hdouri/core/widgets/shared_dashboard_last_scan_text_widget.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/tech_dashboard_scan_list.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/tech_points_list.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/tech_quick_procedures.dart';

import '../../../../exports.dart';

class TechDashboardBody extends StatelessWidget {
  const TechDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechPointsList(),
        Padding(
          padding: getPadding(horizontal: 16.0.w, bottom: 8.0.h, top: 24.h),
          child: Text(
            AppStrings.quickProceduresAr,
            style: getBoldTextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        8.vs,
        TechQuickProcedures(),
        Padding(
          padding: getPadding(top: 24.0.h, bottom: 8.0.h, horizontal: 16.0.w),
          child: SharedDashboardLastScanTextWidget(),
        ),
        TechDashboardScanList(),
      ],
    );
  }
}
