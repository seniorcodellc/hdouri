import 'package:hdouri/exports.dart';

import '../../../../core/widgets/custom_divider.dart';

class HorizontalCustomDivider extends StatelessWidget {
  const HorizontalCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDivider(
      width: 95.w,
      height: 0.5.h,
      color: AppColors.accentColor,
    );
  }
}
