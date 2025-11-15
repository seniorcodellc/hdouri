import 'package:hdouri/exports.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class WarrantyCustomTextField extends StatelessWidget {
  const WarrantyCustomTextField({super.key, required this.hint});
final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(vertical: 10.0.h),
      child: CustomTextFormField(
        hintText: hint,
        style: getRegularTextStyle(fontSize: 14.sp, color: AppColors.grayHint,),
        radiusOfContainer: 20.0.r,
        shadow: 0.3,
      ),
    );
  }
}
