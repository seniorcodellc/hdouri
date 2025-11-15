import '../../../../exports.dart';
import '../models/bottom_nav_bar_model.dart';

class BottomNavBarStatic {
  static List<BottomNavBarModel> screens = [
    BottomNavBarModel(
      asset: AppAssets.home,
      tabName: AppStrings.homeAr,
      systemBarColor: AppColors.gradientColorStart,
    ),
    BottomNavBarModel(
      asset: AppAssets.loyalty,
      tabName: AppStrings.pointsAr,
     // appBatTitle: AppStrings.pointsSummary,
    ),
    BottomNavBarModel(
      asset: AppAssets.logs,
      tabName: AppStrings.logsAr,
      appBatTitle: AppStrings.operationsLogsAr,
    ),
    BottomNavBarModel(
      asset: AppAssets.tabSettings,
      tabName: AppStrings.settings,
      //appBatTitle: AppStrings.settingsAr,
    ),
  ];
}
