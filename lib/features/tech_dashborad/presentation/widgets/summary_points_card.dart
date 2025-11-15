import 'package:cherubini/features/tech_dashborad/presentation/widgets/apply_for_next_gift_row.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/points_summary_card_h_divider.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_text_column.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/total_and_replaced_points_widget.dart';

import '../../../../core/widgets/custom_divider.dart';
import '../../../../exports.dart';

class SummaryPointsCard extends StatelessWidget {
  const SummaryPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w, top: 32.h),
      child: Container(
        //width: 343.w,
        //height: 261.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [AppColors.gradientColorStart, AppColors.gradientColorEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            20.vs,
            Text(
              AppStrings.availablePoints,
              style: getRegularTextStyle(color: AppColors.white, fontSize: 16),
            ),
            10.vs,
            Text(
              "9,250",
              style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.white),
            ),
            11.vs,
            TotalAndReplacedPointsWidget(),
            23.vs,
            ApplyForNextGiftRow(),
            16.vs,
            PointsSummaryCardHDivider(),
          ],
        ),
      ),
    );
  }
}
