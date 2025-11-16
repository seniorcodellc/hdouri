import 'package:hdouri/features/performance_board/data/statics/performance_board_static.dart';

import '../../../../exports.dart';

class PerformanceBoards extends StatelessWidget {
  const PerformanceBoards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(start: 16.w),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1.15,
        children: PerformanceBoardStatic.boards.map((board) {
          return Padding(
            padding: getPadding(end: 16.w, bottom: 16.h),
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(width: 1.w, color: AppColors.darkGray),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Text(
                    board.title,
                    style: getMediumTextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                  ),
                  15.vs,
                  Text(
                    board.hours,
                    style: getMediumTextStyle(
                      fontSize: 40,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  15.vs,
                  Text(
                    board.subTitle,
                    style: getMediumTextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
