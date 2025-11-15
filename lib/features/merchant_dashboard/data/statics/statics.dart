import 'package:cherubini/exports.dart';
import '../../../../core/utils/app_assets.dart';
import '../models/points_model.dart';
import '../models/quick_action_model.dart';
import '../models/scan_model.dart';

class DashboardStatics{
  static List<PointsModel> pointsList = [
    PointsModel(iconPath: AppAssets.loyaltyFilled, title: 'إجمالى النقاط ', number: '12,450'),
    PointsModel(iconPath: AppAssets.gift, title: ' النقاط المستبدلة ', number: '3,200'),
    PointsModel(iconPath: AppAssets.availablePoints, title: ' النقاط المتاحة', number: '9,250'),
  ];
  static List<QuickActionModel> actionsList= [
    QuickActionModel(iconPath: AppAssets.tech, title: 'اداره\nالفنيين', onTap: () { Routes.techniciansManagementRoute.moveTo(); }),
    QuickActionModel(iconPath: AppAssets.loyalty, title: 'ملخص\nالنقاط', onTap: () { Routes.merchantPointsSummary.moveTo();}),
    QuickActionModel(iconPath: AppAssets.history, title: 'سجل\nالعمليات', onTap: () { Routes.operationsHistoryRoute.moveTo();  }),
    QuickActionModel(iconPath: AppAssets.scan, title: 'مسح\nالبار كود  ', onTap: () { Routes.scanRoute.moveTo();  },),

  ];
  static List<ScanModel> scanList = [
    ScanModel(title: 'SC - 002', date: '20/10/2025', points: '250+ ', tech: 'خالد سعيد', number: '5'),
    ScanModel(title: 'SC - 003', date: '30/10/2025', points: '250+ ', tech: 'احمد سعيد', number: '6'),
    ScanModel(title: 'SC - 004', date: '22/10/2025', points: '250+ ', tech: 'محمد سعيد', number: '7'),
    ScanModel(title: 'SC - 005', date: '25/10/2025', points: '250+ ', tech: 'احمد سعيد', number: '4'),
  ];

}