import 'package:cherubini/exports.dart';
class CustomBottomSheet {
  static showCustomBottomSheet(
      {context,
      required Widget content,
      EdgeInsetsDirectional? padding,
      bool isBackground = false,
      BoxConstraints? constraint}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: padding,
        child: content,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      constraints: constraint,
      enableDrag: true,
      elevation: 10,
      backgroundColor: AppColors.white,
    );
  }
}
