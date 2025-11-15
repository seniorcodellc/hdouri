import 'package:hdouri/features/tech_dashborad/data/models/tech_scan_model.dart';
import '../../../../exports.dart';
import '../../../merchant_dashboard/data/models/points_model.dart';

class TechDashboardStatic {
  static List<PointsModel> techPointsList = [
    PointsModel(
      iconPath: AppAssets.loyaltyFilled,
      title: AppStrings.totalPointsAr,
      number: '12,450',
    ),
    PointsModel(
      iconPath: AppAssets.gift,
      title: AppStrings.replacedPointsAr,
      number: '3,200',
    ),
    PointsModel(
      iconPath: AppAssets.availablePoints,
      title: AppStrings.availablePointsAr,
      number: '9,250',
    ),
  ];
  static List<TechScanModel> techScanList = [
    TechScanModel(title: 'SC - 002', date: '20/10/2025', points: '250+ '),
    TechScanModel(title: 'SC - 003', date: '30/10/2025', points: '250+ '),
    TechScanModel(title: 'SC - 004', date: '22/10/2025', points: '250+ '),
    TechScanModel(title: 'SC - 005', date: '25/10/2025', points: '250+ '),
  ];
}
