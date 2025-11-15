import 'package:cherubini/features/tech_dashborad/data/statics/tech_dashboard_static.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/tech_last_scan_item.dart';

import '../../../../exports.dart';

class TechDashboardScanList extends StatelessWidget {
  const TechDashboardScanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(TechDashboardStatic.techScanList.length, (index) {
        final model = TechDashboardStatic.techScanList[index];
        return TechLastScanItem(model: model);
      }),
    );
  }
}
