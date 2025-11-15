import '../../../../exports.dart';

class SharedSmallWhiteContainer extends StatelessWidget {
  const SharedSmallWhiteContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(horizontal: 16.0.w, vertical: 8.0.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2.r,
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0.r,
            blurRadius: 2.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Padding(
        padding: getPadding(horizontal: 16.w, vertical: 10.h),
        child: child,
      ),
    );
  }
}
