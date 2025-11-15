import '../../exports.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    this.leftIcon,
    this.rightIcon,
    this.boxShadow,
    required this.onPressed,
    required this.text,
    this.color,
    this.padding,
    this.topIcon,
    this.side = BorderSide.none,
    this.radius = 10,
    this.height,
    this.elevation,
    this.width,
    this.textColor = AppColors.white,
    this.style,
    this.margin,
  }) : super(key: key);
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final Widget? leftIcon;
  final Widget? topIcon;
  final String text;
  final Widget? rightIcon;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? radius;
  final BorderSide side;
  final Color? color;
  final TextStyle? style;
  final double? elevation;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(163, 40),
          backgroundColor: color ?? AppColors.white,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.accentColor, width: 0.5),
          ),
          // padding: padding ?? EdgeInsets.symmetric(vertical: 13.h),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon.isNotNull) leftIcon!,
            if (rightIcon.isNotNull) 10.hs,
            Text(
              text,
              textAlign: TextAlign.center,
              style:
                  style ?? getRegularTextStyle(color: AppColors.primaryColor),
            ),
            if (rightIcon.isNotNull) rightIcon!,
          ],
        ),
      ),
    );
  }
}
