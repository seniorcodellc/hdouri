import 'package:hdouri/config/errors/widgets/error_text.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../exports.dart';

class TechAnswerVerficationQuestion extends StatelessWidget {
  const TechAnswerVerficationQuestion({
    super.key,
    required this.checkController,
  });
  final TextEditingController checkController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: checkController,
          hintText: AppStrings.merchantCheckHintAr,
          prefixIcon: CustomSVGImage(
            asset: AppAssets.questionMark,
            fit: BoxFit.none,
          ),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) {
            return ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(
                Errors.VERIFICATION_ERROR,
              ),
              text: getError[Errors.VERIFICATION_ERROR],
            );
          },
        ),
      ],
    );
  }
}
