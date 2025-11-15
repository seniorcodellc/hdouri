import 'package:cherubini/exports.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/settings_gray_circle.dart';

import '../../features/authentication/presentation/managers/auth_cubit.dart';

class SharedDashboardHeader extends StatelessWidget {
  const SharedDashboardHeader({super.key, required this.onTap});

  final GestureTapCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 187.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0.r), bottomRight: Radius.circular(50.0.r)),
        gradient: LinearGradient(
          colors: [AppColors.gradientColorStart, AppColors.gradientColorEnd],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Padding(
        padding: getPadding(horizontal: 16.0.w, top: 40.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppStrings.welcome.trans} ${context.read<AuthCubit>().user?.name.validate}',

                  style: getBoldTextStyle(fontSize: 24.sp, color: Colors.white),
                ),
                10.vs,
                Text(
                  AppStrings.merchantCompanyNameAr,
                  style: getRegularTextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ],
            ),
            SettingsGrayCircle(onTap: onTap),
          ],
        ),
      ),
    );
  }
}
