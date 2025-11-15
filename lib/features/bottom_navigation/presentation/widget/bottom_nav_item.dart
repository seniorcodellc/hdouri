import 'package:hdouri/exports.dart';

import '../../data/models/bottom_nav_bar_model.dart';
class BottomNavItem extends StatelessWidget {
  final BottomNavBarModel bottomNavBarModel;
  final bool isSelected;
  final Function() onTap;
  const BottomNavItem({required this.bottomNavBarModel,required this.onTap,required this.isSelected,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: getPadding(horizontal: 10.w, bottom: 5.h, top: 5.h),
        child: Column(
          children: [
            CustomSVGImage(
              asset: bottomNavBarModel.asset,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.unselectedTab,
            ),
            5.vs,
            Text(
              bottomNavBarModel.tabName,
              style: isSelected
                  ? getSemiBoldTextStyle(
                fontSize: 12,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )
                  : getRegularTextStyle(
                fontSize: 12,
                color: AppColors.unselectedTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
