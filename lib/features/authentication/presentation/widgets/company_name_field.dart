import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class CompanyNameField extends StatelessWidget {
  final TextEditingController companyNameController;

  const CompanyNameField({required this.companyNameController,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: companyNameController,
          hintText: AppStrings.companyNameHintAr,
          prefixIcon: CustomSVGImage(
            asset: AppAssets.company,
            fit: BoxFit.none,
          ),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) => ErrorText(
            showError: context
                .read<ErrorCubit>()
                .errors
                .contains(Errors.NAME_ERROR),
            text: getError[Errors.NAME_ERROR],
          ),
        ),
      ],
    );
  }
}
