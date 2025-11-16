import 'package:hdouri/core/widgets/custom_background.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../exports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: AppStrings.notification,),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSVGImage(asset: AppAssets.error),
              24.vs,
              Text(AppStrings.noNotification,style: getBoldTextStyle(fontSize: 16.sp,color: AppColors.darkGray),)
            ],
          ),
        ),
    );
  }
}
