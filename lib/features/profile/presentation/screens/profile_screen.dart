import 'package:hdouri/core/widgets/custom_appbar.dart';
import 'package:hdouri/core/widgets/custom_background.dart';

import '../../../../exports.dart';
import '../widgets/toggle_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: AppStrings.account, actions: [Padding(padding: getPadding(horizontal: 14.0.w),
          child: Icon(Icons.logout, size: 26, color: AppColors.darkGray),)],),
      child: Column(
          children: [
            24.vs,
            CustomPngImage(image: AppAssets.accountPicture),
            16.vs,
            Text(AppStrings.profileName,style: getBoldTextStyle(fontSize: 14.sp,color: AppColors.darkGray),),
            8.vs,
            Text(AppStrings.profileEmail,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.primaryColor),),
            55.vs,
            ToggleItem(),
            220.vs,
            Padding(
              padding: getPadding(horizontal: 108.0.w),
              child: CustomButton(
                text: AppStrings.save,
                onPressed: (){},
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                height: 63.h,
              ),
            )
          ]),
    );
  }
}
