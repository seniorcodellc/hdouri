import '../../exports.dart';

class CustomBox extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final AlignmentDirectional? alignment;
  final Color? color;
  final BoxBorder? boxBorder;
  final EdgeInsetsDirectional? padding;
  final EdgeInsetsDirectional? margin;
  const CustomBox({ required this.child,this.margin ,this.height,this.boxBorder,this.color,this.padding, this.width, this.alignment , super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border:boxBorder,
        color: color??AppColors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x26777777), // #77777726
            offset: const Offset(0, 0.49), // x = 0px, y = 0.49px
            blurRadius: 2.57, // blur-radius = 2.57px
            spreadRadius: 0,
            // spread-radius = 0px
          ),
        ],
      ),
      child: child,
    );
  }
}
