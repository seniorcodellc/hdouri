import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/about_nafaz_widget.dart';
import '../widgets/confirm_number_container.dart';
import '../widgets/nafaz_header_introduction.dart';
class ConfirmRequestScreen extends StatelessWidget {
  const ConfirmRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      statusBarColor: AppColors.lighterGrey,
      child: CustomScrollView(
          slivers:[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  NafazHeaderIntroduction(),
                  45.vs,
                  Padding(
                    padding: getPadding(horizontal: 14.0.w),
                    child: Text(AppStrings.openNafaz,style: getBoldTextStyle(fontSize: 15.sp,color: AppColors.black),textAlign: TextAlign.center,),
                  ),
                  ConfirmNumberContainer(),
                  Padding(
                    padding: getPadding(horizontal: 16.0.w),
                    child: CustomButton(
                      text: AppStrings.cancel,
                      textColor: AppColors.primaryColor,
                      onPressed: (){},
                      backgroundColor: AppColors.bgColor,
                      borderColor: AppColors.primaryColor,
                      borderRadius: 10.r,
                    ),
                  ),
                  70.vs,
                  AboutNafazWidget(),
                ],
              ),
            ),
          ]
      ),
    );
  }
}