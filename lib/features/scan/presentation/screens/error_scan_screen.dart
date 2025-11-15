import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/exports.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/bar_code_details.dart';
import '../widgets/shared_scan_container.dart';

class ErrorScanScreen extends StatelessWidget {
  const ErrorScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppbar(title: AppStrings.scanCode),
      child: Column(
        children: [
          Padding(
            padding: getPadding(vertical: 35.0.h),
            child: SharedScanContainer(asset: AppAssets.errorScan,),
          ),
          BarCodeDetails(isSuccess: false,),
          24.vs,
          Padding(
            padding: getPadding(horizontal: 16.0.w),
            child: CustomButton(text: AppStrings.scanOtherCode,textColor: AppColors.primaryColor, onPressed: (){Routes.errorScanRoute.moveTo();},height: 58.h,backgroundColor: AppColors.whiteLight,borderColor: AppColors.borderColor3,),
          )
        ],
      ),
    );
  }
}
