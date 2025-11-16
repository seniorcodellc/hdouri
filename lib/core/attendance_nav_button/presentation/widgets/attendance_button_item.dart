import '../../../../exports.dart';
import '../../data/models/attendance_nav_button_model.dart';

class AttendanceButtonItem extends StatelessWidget {
  const AttendanceButtonItem({
    super.key,
    required this.asset,
    required this.model,
  });
  final String asset;
  final AttendanceNavButtonModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      height: 60.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0.w, 4.h),
            blurRadius: 4.r,
            spreadRadius: 0.r,
          ),
        ],
        color: AppColors.attendanceButtonItem,
        borderRadius: model.borderRadius,
      ),
      child: CustomSVGImage(asset: asset, fit: BoxFit.none),
    );
  }
}
