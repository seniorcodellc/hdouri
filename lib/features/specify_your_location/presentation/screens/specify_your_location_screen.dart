import 'package:hdouri/core/widgets/custom_appbar.dart';
import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/core/widgets/custom_text_form_field.dart';

import '../../../../exports.dart';

class SpecifyYourLocationScreen extends StatelessWidget {
  const SpecifyYourLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppbar(title: AppStrings.specifyYourLocation),
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.vs,
            Text(
              AppStrings.longitude,
              style: getMediumTextStyle(
                fontSize: 16,
                color: AppColors.lightGray,
              ),
            ),
            8.vs,
            CustomTextFormField(),
            24.vs,
            Text(
              AppStrings.latitude,
              style: getMediumTextStyle(
                fontSize: 16,
                color: AppColors.lightGray,
              ),
            ),
            8.vs,
            CustomTextFormField(),
            88.vs,
            CustomButton(
              svgIconPath: AppAssets.location,
              text: AppStrings.specifyYourLocation,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
