import 'package:hdouri/features/authentication/presentation/widgets/transfer_row.dart';

import '../../../../exports.dart';

class VerifyPopup extends StatelessWidget {
  const VerifyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: getPadding(vertical: 30.0.h,horizontal: 16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.confirmTransfer,
              style: getMediumTextStyle(fontSize: 16.sp, color: AppColors.white,),
            ),
            18.vs,
            Text(
              AppStrings.moveTo,
              style: getRegularTextStyle(fontSize: 12.sp, color: AppColors.white,),
            ),
            TransferRow(),
            Padding(
              padding: getPadding(horizontal:28.0.w),
              child: Text(
                AppStrings.pressMove,
                style: getRegularTextStyle(fontSize: 12.sp, color: AppColors.white,),
                textAlign: TextAlign.center,
              ),
            ),
            18.vs,
            CustomButton(
              text: AppStrings.move,
              onPressed: () {},
              borderColor: AppColors.white,
              backgroundColor: AppColors.white,
              textColor: AppColors.primaryColor,
            ),
            16.vs,
            CustomButton(
              text: AppStrings.cancel,
              onPressed: () {},
              borderColor: AppColors.white,
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

