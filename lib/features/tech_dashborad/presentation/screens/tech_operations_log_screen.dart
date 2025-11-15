import 'package:cherubini/core/widgets/custom_appbar.dart';
import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_log_header.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_logs_list.dart';

import '../../../../exports.dart';

class TechOperationsLogScreen extends StatelessWidget {
  const TechOperationsLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: getPadding(vertical: 30.h),
            child: Column(
              children: [OperationsLogHeader(), 24.vs, OperationsLogsList()],
            ),
          ),
        ),
      ],
    );
  }
}
