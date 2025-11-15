import '../../../../core/widgets/custom_divider.dart';
import '../../../../exports.dart';

class PointsSummaryCardHDivider extends StatelessWidget {
  const PointsSummaryCardHDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 18.0.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomDivider(color: AppColors.white, width: 311, height: 11),
          CustomDivider(color: AppColors.primaryColor, width: 276, height: 11),
        ],
      ),
    );
  }
}
