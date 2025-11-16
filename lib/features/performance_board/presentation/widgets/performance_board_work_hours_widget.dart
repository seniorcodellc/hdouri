import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_shared_icons_container.dart';

import '../../../../exports.dart';

class PerformanceBoardWorkHoursWidget extends StatelessWidget {
  const PerformanceBoardWorkHoursWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Row(
        children: [
          PerformanceBoardSharedIconsContainer(asset: AppAssets.menu),
          16.hs,
          PerformanceBoardSharedIconsContainer(asset: AppAssets.graph),
          41.hs,
          Text(
            AppStrings.workHoursText,
            style: getMediumTextStyle(fontSize: 16, color: AppColors.black),
          ),
          34.hs,
          Text(
            AppStrings.workHours,
            style: getMediumTextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
