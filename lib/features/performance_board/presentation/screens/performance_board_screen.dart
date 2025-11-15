import 'package:hdouri/core/widgets/custom_appbar.dart';
import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_header.dart';
import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_shared_date_widget.dart';
import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_shared_icons_container.dart';
import 'package:hdouri/features/performance_board/presentation/widgets/performance_board_work_hours_widget.dart';

import '../../../../exports.dart';
import '../widgets/performance_boards.dart';

class PerformanceBoardScreen extends StatelessWidget {
  const PerformanceBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(
        actions: [
          Padding(
            padding: getPadding(end: 16.w),
            child: GestureDetector(
              onTap: () {},
              child: CustomSVGImage(
                color: AppColors.darkGray,
                asset: AppAssets.refresh,
              ),
            ),
          ),
        ],
        title: AppStrings.performanceBoard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.vs,
          PerformanceBoardHeader(),
          32.vs,
          PerformanceBoardWorkHoursWidget(),
          32.vs,
          PerformanceBoards(),
        ],
      ),
    );
  }
}
