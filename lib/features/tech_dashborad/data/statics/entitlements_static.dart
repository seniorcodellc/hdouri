import 'package:hdouri/features/tech_dashborad/data/models/entitlements_model.dart';

class EntitlementsStatic {
  static List<EntitlementsModel> entitlementsList = [
    EntitlementsModel(
      title: '#12356',
      date: '20/10/2025',
      totalPoints: '1500 نقطة',
      replacedPoints: '500 نقطة',
      pointsValue: '100 ريال',
      isDone: true,
    ),
    EntitlementsModel(
      title: '#12356',
      date: '20/10/2025',
      totalPoints: '1500 نقطة',
      replacedPoints: '500 نقطة',
      pointsValue: '100 ريال',
      isDone: false,
    ),
  ];
}
