import '../../../../exports.dart';

class ToggleRow extends StatelessWidget {
  const ToggleRow({super.key, required this.child, required this.title});

  final Widget child ;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: getMediumTextStyle(fontSize: 14.sp,color: AppColors.darkGray),),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Padding(
            padding: getPadding(horizontal: 7.0.w,vertical: 6.0.h),
            child: child
          ),
        ),
      ],
    );
  }
}
