import 'package:hdouri/exports.dart';
import 'package:hdouri/config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SharedPasswordTextField extends StatelessWidget {
  const SharedPasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: passwordController,
          hintText: AppStrings.passwordHintAr,
          prefixIcon: CustomSVGImage(asset: AppAssets.lock, fit: BoxFit.none),
          suffixIcon: CustomSVGImage(asset: AppAssets.eyeOn, fit: BoxFit.none),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(
              Errors.PASSWORD_ERROR,
            ),
            text: getError[Errors.PASSWORD_ERROR],
          ),
        ),
      ],
    );
  }
}
