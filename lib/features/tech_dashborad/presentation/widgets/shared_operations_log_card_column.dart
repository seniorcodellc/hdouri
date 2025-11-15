import '../../../../exports.dart';

class SharedOperationsLogCardColumn extends StatelessWidget {
  const SharedOperationsLogCardColumn({super.key, required this.title, required this.subTitle});
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: getRegularTextStyle(fontSize: 16, color: AppColors.white)),
          AnimatedSwitcher(
            duration: 1.microseconds,
            child: subTitle.isNotNull
                ? Text(subTitle!, style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.white))
                : Padding(
                    padding: getPadding(top: 15.h),
                    child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.white)),
                  ),
          ),
        ],
      ),
    );
  }
}
