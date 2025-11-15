import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_custom_divider_vertical.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_operations_log_card_column.dart';

import '../../../../core/widgets/custom_divider.dart';
import '../../../../exports.dart';

class OperationsLogHeader extends StatelessWidget {
  const OperationsLogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [AppColors.gradientColorStart, AppColors.gradientColorEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SharedOperationsLogCardColumn(
            title: AppStrings.totalOperationsAr,
            subTitle: '3',
          ),
          CustomDivider(width: 0.6.w, height: 40.h, color: AppColors.white),
          SharedOperationsLogCardColumn(
            title: AppStrings.totalPointsAr,
            subTitle: '500',
          ),
        ],
      ),
    );
  }
}
