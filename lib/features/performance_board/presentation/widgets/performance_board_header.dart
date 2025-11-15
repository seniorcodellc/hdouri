import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_shared_date_widget.dart';

import '../../../../exports.dart';

class PerformanceBoardHeader extends StatelessWidget {
  const PerformanceBoardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            AppStrings.from,
            style: getMediumTextStyle(fontSize: 16, color: AppColors.darkGray),
          ),
          16.hs,
          PerformanceBoardSharedDateWidget(text: AppStrings.startDate),
          35.hs,
          Text(
            AppStrings.to,
            style: getMediumTextStyle(fontSize: 16, color: AppColors.darkGray),
          ),
          16.hs,
          PerformanceBoardSharedDateWidget(text: AppStrings.endDate),
        ],
      ),
    );
  }
}
