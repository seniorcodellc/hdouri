import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/exports.dart';

import '../../../tech_dashborad/presentation/widgets/entitlements_list.dart';
import '../../../tech_dashborad/presentation/widgets/summary_points_card.dart';
import '../../../tech_dashborad/presentation/widgets/tech_points_register.dart';
import '../widgets/merchant_entitlements_list.dart';

class MerchantPointsSummary extends StatelessWidget {
  const MerchantPointsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showNavBar: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SummaryPointsCard(),
                16.vs,
                Padding(
                  padding: getPadding(horizontal: 16.w),
                  child: Text(
                    AppStrings.entitlementsAr,
                    style: getBoldTextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                16.vs,
                // ReplacingOptionsList(),
                MerchantEntitlementsList(),
                24.vs,
                Padding(
                  padding: getPadding(horizontal: 16.w),
                  child: Text(
                    AppStrings.pointsLogAr,
                    style: getBoldTextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                16.vs,
                PointsRegister(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


