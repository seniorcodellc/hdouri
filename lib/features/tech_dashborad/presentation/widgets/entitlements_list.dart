import 'package:hdouri/features/tech_dashborad/data/statics/entitlements_static.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/entitlements_list_item.dart';

import '../../../../exports.dart';

class EntitlementsList extends StatelessWidget {
  const EntitlementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Column(
        children: List.generate(EntitlementsStatic.entitlementsList.length, (
          index,
        ) {
          final model = EntitlementsStatic.entitlementsList[index];
          return EntitlementsListItem(model: model);
        }),
      ),
    );
  }
}
