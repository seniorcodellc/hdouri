import 'package:cherubini/exports.dart';
import '../../../../core/history/data/models/history_response_model.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../tech_dashborad/presentation/widgets/operations_log_header.dart';
import '../../../tech_dashborad/presentation/widgets/shared_operations_log_card_column.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/history/data/models/history_response_model.dart';
import '../../../../core/widgets/operation_details_item.dart';

class OperationsDetailsScreen extends StatelessWidget {
  HistoryModel? historyModel;

  OperationsDetailsScreen({super.key});
  get _buildTotalPointsAndNumberOfOperations => Container(
    width: 343.w,
    height: 107.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      gradient: LinearGradient(
        colors: [AppColors.gradientColorStart, AppColors.gradientColorEnd],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SharedOperationsLogCardColumn(title: AppStrings.totalOperationsAr, subTitle: historyModel!.detail!.length.toString()),
        CustomDivider(width: 0.6.w, height: 40.h, color: AppColors.white),
        SharedOperationsLogCardColumn(title: AppStrings.totalPointsAr, subTitle: historyModel!.points.toString()),
      ],
    ),
  );

  get _buildScannedItemsDetails => OperationDetailsItem(model: historyModel!);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      historyModel = data!['history'];
    }
    return CustomBackground(
      title: AppStrings.operationDetails,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: getPadding(vertical: 30.h),
              child: Column(children: [_buildTotalPointsAndNumberOfOperations, 24.vs, _buildScannedItemsDetails]),
            ),
          ),
        ],
      ),
    );
  }
}
