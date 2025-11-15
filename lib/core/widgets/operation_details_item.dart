import 'package:cherubini/core/widgets/custom_divider.dart';
import 'package:cherubini/core/widgets/h_line.dart';
import 'package:cherubini/core/widgets/second_shared_custom_button.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_log_card_header.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_log_card_prods_header.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/operations_log_card_prods_list.dart';

import '../history/data/models/history_response_model.dart';
import '../../exports.dart';
import '../../features/tech_dashborad/presentation/widgets/scan_blue_circle.dart';

class OperationDetailsItem extends StatelessWidget {
  const OperationDetailsItem({super.key, required this.model});
  final HistoryModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 2.r, blurRadius: 6.r, offset: Offset(0, 2.h)),
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 0.r, blurRadius: 2.r, offset: Offset(0, 1.h)),
        ],
      ),
      child: Padding(
        padding: getPadding(horizontal: 16.h, vertical: 24.w),
        child: Column(
          children: [
            _buildHeaderInfo,
            16.vs,
            HLine(),
            _buildNumberOfProducts,
            16.vs,
            ..._buildDetailsList,
            16.vs,
            SecondSharedCustomButton(
              text: AppStrings.publishWarranty,
              onPressed: () {
                Routes.techWarrantyRoute.moveTo();
              },
            ),
            /*

              16.vs,
              16.vs,
              SecondSharedCustomButton(
                text: AppStrings.publishWarranty,
                onPressed: () {
                  Routes.techWarrantyRoute.moveTo();
                },
              ),*/
          ],
        ),
      ),
    );
  }
  get _buildDetailsList=>List.generate(model.detail!.length,
          (index) {
    return Padding(
      padding: getPadding(vertical: 8.h),
      child: Container(
        width: 311.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: AppColors.mutedBlue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: getPadding(horizontal: 16.w, top: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.detail![index].productName.toString(),
                style: getRegularTextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  model.detail![index].serialNumber.toString(),
                  style: getRegularTextStyle(
                    color: AppColors.grayHint,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
  get _buildNumberOfProducts => Row(
    children: [
      CustomSVGImage(asset: AppAssets.prods),
      16.hs,
      Text("المنتجات (${model.detail!.length})", style: getRegularTextStyle(fontSize: 16, color: AppColors.subTitleColor)),
    ],
  );
  get _buildHeaderInfo => Row(
    children: [
      ScanBlueCircle(),
      8.hs,
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model!.id!.toString()),
          Row(
            children: [
              CustomSVGImage(asset: AppAssets.grayCalendar),
              8.hs,
              Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(model.date!)).toString()),
            ],
          ),
        ],
      ),
      Spacer(),
      Container(
        width: 92.w,
        height: 27.h,
        decoration: BoxDecoration(color: AppColors.accentColor, borderRadius: BorderRadius.circular(20.r)),
        child: Center(
          child: Text("${model.points} + نقطة", style: getRegularTextStyle(fontSize: 16, color: AppColors.white)),
        ),
      ),
    ],
  );
}
