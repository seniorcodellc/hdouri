import 'package:hdouri/exports.dart';
import 'package:hdouri/features/technican_management/presentation/widgets/shared_toggle_item.dart';

import '../../../../core/enums/status_enums.dart';

class ManagementToggle extends StatefulWidget {
  final Function(Status status) onTabSelected;
  final bool? selectedTab;

  const ManagementToggle({
    super.key,
    required this.onTabSelected,
    this.selectedTab,
  });

  @override
  State<ManagementToggle> createState() => _ManagementToggleState();
}

class _ManagementToggleState extends State<ManagementToggle> {
  Status status =Status.ACTIVE;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: getPadding(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.mutedBlue,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: getPadding(horizontal: 5.0.w),
        child: Row(
          children: [
            Expanded(child: SharedToggleItem(
              text: AppStrings.activeTech,
              color: status==Status.ACTIVE ? AppColors.white : AppColors.mutedBlue,
              style: getBoldTextStyle(
                fontSize: 12.sp,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                if(status.isNotEqualTo(Status.ACTIVE)){
                  status=Status.ACTIVE;
                  widget.onTabSelected(status);
                  setState(() {

                  });
                }


              },
            )),
            4.hs,
            Expanded(child: SharedToggleItem(
              text: AppStrings.waitingTech,
              color: status==Status.PENDING ? AppColors.white : AppColors.mutedBlue,
              style: getBoldTextStyle(
                fontSize: 12.sp,
                color: AppColors.primaryColor,
              ),
              onTap: () {

                if(status.isNotEqualTo(Status.PENDING)){
                  status=Status.PENDING;
                  widget.onTabSelected(status);
                  setState(() {

                  });
                }

              },
            )),   4.hs,
            Expanded(child: SharedToggleItem(
              text: AppStrings.suspended,
              color: status==Status.SUSPENDED ? AppColors.white : AppColors.mutedBlue,
              style: getBoldTextStyle(
                fontSize: 12.sp,
                color: AppColors.primaryColor,
              ),
              onTap: () {

                if(status.isNotEqualTo(Status.SUSPENDED)){
                  status=Status.SUSPENDED;
                  widget.onTabSelected(status);
                  setState(() {

                  });
                }

              },
            )),
          ],
        ),
      ),
    );
  }
}