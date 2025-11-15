import '../../../../core/widgets/custom_background.dart';
import '../../../../exports.dart';
import '../widgets/about_nafaz_widget.dart';
import '../widgets/id_text_field.dart';
import '../widgets/nafaz_header_introduction.dart';
import '../widgets/or_using_widget.dart';

class LoginNafazScreen extends StatelessWidget {
    LoginNafazScreen({super.key});
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.bgColor,
      statusBarColor: AppColors.lighterGrey,
      child: CustomScrollView(
          slivers:[
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    NafazHeaderIntroduction(),
                    45.vs,
                    Text(AppStrings.enterByNafaz,style: getBoldTextStyle(fontSize: 18.sp,color: AppColors.black),),
                    35.vs,
                    IdTextField(controller: idController,),
                    35.vs,
                    Padding(
                      padding: getPadding(horizontal: 16.0.w),
                      child: CustomButton(
                        text: AppStrings.login,
                        onPressed: () {
                          checkStringError(context, idController.text, Errors.ID_ERROR,);
                          if (dontHaveErrors(context)) {
                            Routes.confirmRequest.moveTo();
                          }
                        },
                        backgroundColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        borderRadius: 10.r,
                        svgIconPath: AppAssets.login,
                      ),
                    ),
                    OrUsingWidget(),
                    Padding(
                      padding: getPadding(horizontal: 16.0.w),
                      child: CustomButton(
                        text: AppStrings.emailAndPassword,
                        textColor: AppColors.primaryColor,
                        onPressed: (){},
                        backgroundColor: AppColors.bgColor,
                        borderColor: AppColors.primaryColor,
                        borderRadius: 10.r,
                      ),
                    ),
                    40.vs,
                    AboutNafazWidget(),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}