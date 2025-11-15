import 'package:hdouri/exports.dart';

import '../../../tech_dashborad/data/statics/entitlements_static.dart';
import 'merchant_entitlements_list_item.dart';

class MerchantEntitlementsList extends StatelessWidget {
  const MerchantEntitlementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Column(
        children: List.generate(EntitlementsStatic.entitlementsList.length, (
            index,
            ) {
          final model = EntitlementsStatic.entitlementsList[index];
          return MerchantEntitlementsListItem(model: model);
        }),
      ),
    );
  }
}
