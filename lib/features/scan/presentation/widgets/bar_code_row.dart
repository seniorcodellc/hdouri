// core/widgets/bar_code_row.dart
import 'package:cherubini/exports.dart';

class BarCodeRow extends StatelessWidget {
  final String title;
  final String value;

  const BarCodeRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.0.w, vertical: 12.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getRegularTextStyle(
              fontSize: 12.sp,
              color: AppColors.subTitleColor,
            ),
          ),
          Text(
            value,
            style: getRegularTextStyle(
              fontSize: 12.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}