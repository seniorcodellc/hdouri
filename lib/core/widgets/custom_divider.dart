import '../../exports.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height, this.width, this.r, this.marginBottom, this.color = AppColors.darkBlue});

  final Color color;
  final double? width;
  final double? height;
  final double? r;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: marginBottom ?? 8.h),
      width: width ?? 134.w,
      height: height ?? 5.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(r ?? 20.r), color: color),
    );
  }
}
