import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.controller});
  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.email,style: getMediumTextStyle(fontSize: 14.sp,color: AppColors.grayHint),),
        8.vs,
        CustomTextFormField(controller:controller , radiusOfContainer: 10.r,borderColor: AppColors.grey,),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(
              Errors.EMAIL_ERROR,
            ),
            text: getError[Errors.EMAIL_ERROR],
          ),
        ),

      ],
    );
  }
}
