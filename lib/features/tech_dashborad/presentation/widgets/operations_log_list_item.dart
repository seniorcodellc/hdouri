import 'package:hdouri/core/widgets/custom_divider.dart';
import 'package:hdouri/core/widgets/second_shared_custom_button.dart';
import 'package:hdouri/features/tech_dashborad/data/models/operations_log_model.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/operations_log_card_header.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/operations_log_card_prods_header.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/operations_log_card_prods_list.dart';

import '../../../../exports.dart';

class OperationsLogListItem extends StatelessWidget {
  const OperationsLogListItem({super.key, required this.model});
  final OperationsLogModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 24.h),
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 2.r,
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 0.r,
              blurRadius: 2.r,
              offset: Offset(0, 1.h),
            ),
          ],
        ),
        child: Padding(
          padding: getPadding(horizontal: 16.h, vertical: 24.w),
          child: Column(
            children: [
              OperationsLogCardHeader(model: model),
              16.vs,
              CustomDivider(
                width: 311.w,
                height: 0.3.h,
                color: AppColors.grayHint,
              ),
              16.vs,
              OperationsLogCardProdsHeader(model: model),
              16.vs,
              OperationsLogCardProdsList(model: model),
              16.vs,
              SecondSharedCustomButton(
                text: AppStrings.publishWarranty,
                onPressed: () {
                  Routes.techWarrantyRoute.moveTo();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
