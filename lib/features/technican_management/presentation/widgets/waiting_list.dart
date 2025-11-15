import 'package:cherubini/exports.dart';
import 'package:cherubini/features/technican_management/presentation/widgets/waiting_tech_item.dart';

import '../../data/models/technician_response_model/technician_response_model.dart';
import '../manager/technician_cubit.dart';

class WaitingList extends StatelessWidget {
  const WaitingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericListView<TechnicianCubit, TechnicianModel>(
      itemWidget: (item, items, index) => WaitingTechItem(item: item),
      separatorWidget: 16.vs,
      shimmerWidget: (index) => SizedBox.shrink(),
    );

    //   ListView.builder(
    //   key: const ValueKey(false),
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: ManagementStatics.techWaitingList.length,
    //   itemBuilder: (context, index) {
    //     final model = ManagementStatics.techWaitingList[index];
    //     return WaitingTechItem(model: model);
    //   },
    // );
  }
}
