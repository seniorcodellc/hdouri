import 'package:cherubini/config/data_generic/presentation/widgets/generic_data_view.dart';
import 'package:cherubini/core/history/presentation/manager/history_cubit.dart';
import 'package:cherubini/core/profile/data/models/profile_response_model.dart';
import 'package:cherubini/core/profile/presentation/manager/profile_cubit.dart';
import 'package:cherubini/exports.dart';
import '../../../../core/history/data/models/history_response_model.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/operation_details_item.dart';
import '../../../../core/widgets/operation_details_item_shimmer.dart';
import '../../../tech_dashborad/presentation/widgets/operations_log_header.dart';
import '../../../tech_dashborad/presentation/widgets/shared_operations_log_card_column.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/history/data/models/history_response_model.dart';

class OperationsHistoryScreen extends StatelessWidget {
  OperationsHistoryScreen({super.key});
  _buildTotalPointsAndNumberOfOperations(BuildContext context) => Container(
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
        BlocBuilder<HistoryCubit, CubitStates>(
          builder: (context, state) => SharedOperationsLogCardColumn(
            title: AppStrings.totalOperationsAr,
            subTitle: (state is LoadedState<List<HistoryModel>>) ? state.data.length.toString() : null,
          ),
        ),
        CustomDivider(width: 0.6.w, height: 40.h, color: AppColors.white),

        GenericDataView<ProfileCubit, ProfileModel>.fromState(
          buildLoadedWidgetWithState: (state) => SharedOperationsLogCardColumn(
            title: AppStrings.totalPointsAr,
            subTitle: (state is LoadedState<ProfileModel>) ? state.data.totalPoints.toString() : null,
          ),
        ),
      ],
    ),
  );

  // get _buildScannedItemsDetails => MerchantOperationsLogListItem(model: historyModel!);
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      title: AppStrings.operationHistory,
      statusBarColor: AppColors.scaffold,
      appBarBackgroundColor: AppColors.bgColor,
showNavBar: true,
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: getPadding(bottom: 24.h, top: 23.h),
                child: _buildTotalPointsAndNumberOfOperations(context),
              ),
            ),
            SliverToBoxAdapter(
              child: GenericListView<HistoryCubit, HistoryModel>(
                separatorWidget: 24.vs,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                shimmerWidget: (index) => OperationDetailsItemShimmer(),
                itemWidget: (index, items, item) => OperationDetailsItem(model: item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
