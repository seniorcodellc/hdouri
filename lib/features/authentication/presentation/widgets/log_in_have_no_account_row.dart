import 'package:hdouri/exports.dart';

import 'horizontal_custom_divider.dart';

class LogInHaveNoAccountRow extends StatelessWidget {
  const LogInHaveNoAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalCustomDivider(),
        16.hs,
        Text(
          AppStrings.haveNoAccountAr,
          style: getRegularTextStyle(color: AppColors.subTitleColor),
        ),
        16.hs,
        HorizontalCustomDivider(),
      ],
    );
  }
}
