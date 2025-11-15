import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_text_column.dart';

import '../../../../exports.dart';

class TotalAndReplacedPointsWidget extends StatelessWidget {
  const TotalAndReplacedPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SharedTextColumn(text: AppStrings.totalAr, num: "12,450"),
          VerticalDivider(color: AppColors.white, thickness: 1.w, width: 50.w),
          SharedTextColumn(text: AppStrings.replaced, num: "3,200"),
        ],
      ),
    );
  }
}
