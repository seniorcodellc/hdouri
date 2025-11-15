import '../../../../exports.dart';

class SharedQuickProceduresItem extends StatelessWidget {
  const SharedQuickProceduresItem({
    super.key,
    required this.asset,
    required this.text,
    required this.onTap,
  });
  final String asset;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 164,
        height: 119,
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
        child: Column(
          children: [
            Padding(
              padding: getPadding(horizontal: 12.w, vertical: 12.h),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColorStart,
                      AppColors.gradientColorEnd,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomSVGImage(
                  asset: asset,
                  fit: BoxFit.none,
                  color: AppColors.white,
                ),
              ),
            ),
            Text(
              text,
              style: getRegularTextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
