import '../../../../exports.dart';

class SharedDoneOrNotContainer extends StatelessWidget {
  const SharedDoneOrNotContainer({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
  });
  final String text;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Padding(
          padding: getPadding(horizontal: 6.0.w,vertical: 2.0.h),
          child: Text(text, style: getRegularTextStyle(color: textColor)),
        ),
      ),
    );
  }
}
