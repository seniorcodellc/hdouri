import 'package:hdouri/exports.dart';
class HLine extends StatelessWidget {
  HLine({
    super.key,
    this.verticalPadding,
    this.color,
    this.thickness,
    this.width,
  });
  double? verticalPadding;
  double? thickness;
  Color? color;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10.h),
      child: Container(
        width: width ?? double.infinity,
        height: thickness ?? 1,
        color: color ?? AppColors.dots,
      ),
    );
  }
}

class VLine extends StatelessWidget {
  const VLine({super.key, this.color, this.thik, this.padd, this.height});
  final Color? color;
  final double? thik;
  final double? padd;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padd ?? 10.h),
      child: Container(
        height: height ?? 32.h,
        width: thik ?? 2.w,
        color: color ?? AppColors.borderColor,
      ),
    );
  }
}
