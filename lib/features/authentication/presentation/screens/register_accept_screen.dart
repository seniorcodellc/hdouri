import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/core/widgets/second_shared_custom_button.dart';
import 'package:hdouri/features/authentication/presentation/widgets/register_accept_body.dart';

import '../../../../exports.dart';

class RegisterAcceptScreen extends StatelessWidget {
  const RegisterAcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: Column(
          children: [
            73.vs,
            Container(
              width: 343.w,
              height: 480.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.subTitleColor.withOpacity(0.1),
                    blurRadius: 8.r,
                    spreadRadius: 3.r,
                  ),
                ],
              ),
              child: Padding(
                padding: getPadding(top: 68.h),
                child: RegisterAcceptBody(),
              ),
            ),
            71.vs,
            SecondSharedCustomButton(
              text: AppStrings.returnToSignUpButtonAr,
              onPressed: () {
                Routes.loginRoute.moveTo();
              },
            ),
          ],
        ),
      ),
    );
  }
}
