import 'package:cherubini/config/errors/widgets/error_text.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class SharedEnterNameTextField extends StatelessWidget {
  const SharedEnterNameTextField({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          hintText: AppStrings.fullNameHintAr,
          prefixIcon: CustomSVGImage(asset: AppAssets.profile, fit: BoxFit.none),
          controller: nameController,
        ),
        BlocBuilder<ErrorCubit, CubitStates>(builder: (context, state) => ErrorText(
            showError: context.read<ErrorCubit>().errors.contains(Errors.NAME_ERROR),
            text: getError[Errors.NAME_ERROR])),
      ],
    );
  }
}
