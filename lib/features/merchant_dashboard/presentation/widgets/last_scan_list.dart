import 'package:cherubini/core/history/data/models/history_response_model.dart';
import 'package:cherubini/core/history/presentation/manager/history_cubit.dart';
import 'package:cherubini/features/merchant_dashboard/presentation/widgets/last_scan_shimmer.dart';
import 'package:flutter/material.dart';
import '../../data/statics/statics.dart';
import 'last_scan_item.dart';
import 'package:cherubini/exports.dart';

class LastScanList extends StatelessWidget {
  const LastScanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: getPadding(horizontal: 16.w, top: 16.0.h, bottom: 8.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.lastScanOperationsAr,
                style: getBoldTextStyle(fontSize: 14.sp, color: AppColors.primaryColor),
              ),
              Text(
                AppStrings.displayAllAr,
                style: getRegularTextStyle(fontSize: 12.sp, color: AppColors.primaryColor),
              ),
            ],
          ),
        ),16.vs,
        Expanded(
          child: GenericListView<HistoryCubit, HistoryModel>(
            padding: getPadding(horizontal: 16.w),
            physics: const NeverScrollableScrollPhysics(),
            onItemTapped: (index, item) {
              Routes.operationsDetailsRoute.moveToWithArgs({'history': item});
            },
            itemWidget: (index, items, item) => LastScanItem(history: item),

            separatorWidget: 8.vs,
            shimmerWidget: (index) => LastScanShimmer(),
          ),
        ),
      ],
    );
  }
}
