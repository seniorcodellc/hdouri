import 'package:hdouri/config/errors/widgets/error_text.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class SharedPhoneTextField extends StatelessWidget {
  const SharedPhoneTextField({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          hintText: AppStrings.phoneNumHintAr,
          controller: phoneController,
          keyboardType: TextInputType.phone,
          prefixIcon: CustomSVGImage(asset: AppAssets.phone, fit: BoxFit.none),
             ),
        BlocBuilder<ErrorCubit,CubitStates>

          (builder: (context, state) => ErrorText(
            text: getError[Errors.PHONE_ERROR],
            showError: context.read<ErrorCubit>().errors.contains(Errors.PHONE_ERROR)),)
      ],
    );
  }
}
