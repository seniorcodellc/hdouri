import 'package:hdouri/exports.dart';
import 'package:hdouri/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SharedConfirmPasswordTextField extends StatelessWidget {
  const SharedConfirmPasswordTextField({super.key, required this.confirmPasswordController});

  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller:confirmPasswordController,
          hintText: AppStrings.passwordHintAr,
          prefixIcon: CustomSVGImage(asset: AppAssets.lock, fit: BoxFit.none),
          suffixIcon: CustomSVGImage(asset: AppAssets.eyeOn, fit: BoxFit.none),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(
              Errors.MATCHING_PASSWORD_ERROR,
            ),
            text: getError[Errors.MATCHING_PASSWORD_ERROR],
          ),
        ),
      ],
    );
  }
}
