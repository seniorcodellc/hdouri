import 'package:hdouri/features/profile/presentation/widgets/toggle_row.dart';

import '../../../../exports.dart';

class ToggleItem extends StatelessWidget {
  const ToggleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 32.0.w),
      child: Column(
        children: [
          ToggleRow(
            title: AppStrings.favoriteEntry,
            child: Row(
            children: [
              CustomSVGImage(asset: AppAssets.cameraWhite),
              38.hs,
              CustomSVGImage(asset: AppAssets.toggle),
            ],
          ),),
          16.vs,
          ToggleRow(
            title: AppStrings.favoriteLanguage,
            child: Row(
              children: [
                Text(AppStrings.arabic,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.white),),
                16.hs,
                CustomSVGImage(asset: AppAssets.toggle),
              ],
            ),
          ),
          16.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.support,style: getMediumTextStyle(fontSize: 14.sp,color: AppColors.darkGray),),
              CustomButton(
                text: AppStrings.open,
                onPressed: (){},
                borderRadius: 25.r,
                backgroundColor: AppColors.primaryColor,
                height: 35.h,
                width: 120.w,),
            ],
          ),
        ],
      ),
    );
  }
}
