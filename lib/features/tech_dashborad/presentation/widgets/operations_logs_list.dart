import 'package:cherubini/features/tech_dashborad/data/statics/operations_log_static.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_log_list_item.dart';

import '../../../../exports.dart';

class OperationsLogsList extends StatelessWidget {
  const OperationsLogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(OperationsLogStatic.operationsLogList.length, (
        index,
      ) {
        final model = OperationsLogStatic.operationsLogList[index];
        return OperationsLogListItem(model: model);
      }),
    );
  }
}
