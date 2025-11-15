import 'package:cherubini/exports.dart';
import 'package:dotted_border/dotted_border.dart';

class SharedScanContainer extends StatelessWidget {
  const SharedScanContainer({super.key, required this.asset});
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 30.0.w),
      child: DottedBorder(
        color: AppColors.borderColor3,
        strokeWidth: 3.0.w,
        borderType: BorderType.RRect,
        radius: Radius.circular(20.0.r),
        dashPattern: const [8, 4],
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mutedBlue,
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          child: Padding(
            padding: getPadding(
              horizontal: 28.0.w,
              top: 50.0.h,
              bottom: 40.0.h,
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CustomSVGImage(asset: asset),
            ),
          ),
        ),
      ),
    );
  }
}
