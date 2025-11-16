import '../../../../exports.dart';

class PerformanceBoardSharedDateWidget extends StatelessWidget {
  const PerformanceBoardSharedDateWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.w,
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGray, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          style: getMediumTextStyle(fontSize: 16, color: AppColors.darkGray),
        ),
      ),
    );
  }
}
