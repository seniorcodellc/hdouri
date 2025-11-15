import '../../../../exports.dart';

class ConfirmNumberContainer extends StatelessWidget {
  const ConfirmNumberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(vertical: 62.0.h,),
      child: Container(
        width:100.w,
        height:100.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Center(
          child: Text('18',style: getBoldTextStyle(fontSize: 42.sp,color: AppColors.white),),
        ),
      ),
    );
  }
}
