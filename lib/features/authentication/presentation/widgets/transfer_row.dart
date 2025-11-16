import '../../../../exports.dart';

class TransferRow extends StatelessWidget {
  const TransferRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(vertical: 35.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.nafazCountry,style: getBoldTextStyle(fontSize: 22.sp,color: AppColors.white),),
          25.hs,
          CustomSVGImage(asset: AppAssets.exchange,),
          25.hs,
          Text(AppStrings.education,style: getBoldTextStyle(fontSize: 22.sp,color: AppColors.white),),
        ],
      ),
    );
  }
}
