import 'package:hdouri/core/widgets/custom_divider.dart';

import '../../../../exports.dart';

class SharedCustomDividerVertical extends StatelessWidget {
  const SharedCustomDividerVertical({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomDivider(
      width: 0.18.w,
      height: 42.h,
      color: AppColors.subTitleColor,
    );
  }
}
