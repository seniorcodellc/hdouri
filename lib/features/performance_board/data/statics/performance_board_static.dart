import 'package:hdouri/exports.dart';
import 'package:hdouri/features/performance_board/data/models/performance_board_model.dart';

class PerformanceBoardStatic {
  static List<PerformanceBoardModel> boards = [
    PerformanceBoardModel(
      title: AppStrings.permissionHour,
      subTitle: AppStrings.hour,
      hours: '00:00',
    ),
    PerformanceBoardModel(
      title: AppStrings.permissionDay,
      subTitle: AppStrings.day,
      hours: '0',
    ),
    PerformanceBoardModel(
      title: AppStrings.earlyDismissal,
      subTitle: AppStrings.hour,
      hours: '0',
    ),
    PerformanceBoardModel(
      title: AppStrings.delayAttendance,
      subTitle: AppStrings.hour,
      hours: '0',
    ),
  ];
}
