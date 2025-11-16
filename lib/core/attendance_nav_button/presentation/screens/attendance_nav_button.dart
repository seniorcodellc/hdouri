import 'package:hdouri/core/attendance_nav_button/data/statics/attendance_nav_button_static.dart';
import 'package:hdouri/core/attendance_nav_button/presentation/widgets/attendance_button_item.dart';
import 'package:hdouri/core/widgets/custom_appbar.dart';
import 'package:hdouri/core/widgets/custom_background.dart';

import '../../../../exports.dart';

class AttendanceNavButton extends StatefulWidget {
  const AttendanceNavButton({super.key});

  @override
  State<AttendanceNavButton> createState() => _AttendanceNavButtonState();
}

class _AttendanceNavButtonState extends State<AttendanceNavButton> {
  int selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: ""),
      bottomNavRoute: Padding(
        padding: getPadding(bottom: 94.h, horizontal: 16.w),
        child: Container(
          width: 343.w,
          height: 72.h,
          decoration: BoxDecoration(
            color: AppColors.attendanceButtonBg,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Padding(
            padding: getPadding(horizontal: 5.w, bottom: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavBarTab(0),
                bottomNavBarTab(1),
                bottomNavBarTab(2),
              ],
            ),
          ),
        ),
      ),
      child: AttendanceNavButtonStatic.tabs[selectedIndex].body,
    );
  }

  Widget bottomNavBarTab(int index) {
    final model = AttendanceNavButtonStatic.tabs[index];
     final bool isSelected = selectedIndex == index;

    return GestureDetector(
       behavior: HitTestBehavior.translucent,
      onTap: () {setState(() => selectedIndex = index);},
      child: AttendanceButtonItem(asset: model.asset, model: model, isSelected: isSelected,),
    );
  }
}
