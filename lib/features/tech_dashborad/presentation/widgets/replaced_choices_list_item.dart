import 'package:hdouri/features/tech_dashborad/data/models/replaced_choices_model.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/gift_blue_circle.dart';

import '../../../../exports.dart';

class ReplacedChoicesListItem extends StatelessWidget {
  const ReplacedChoicesListItem({super.key, required this.model});
  final ReplacedChoicesModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2.r,
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0.r,
            blurRadius: 2.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Padding(
        padding: getPadding(top: 15.h),
        child: Column(
          children: [
            GiftBlueCircle(),
            10.vs,
            Text(
              model.title,
              style: model.title == "منتج مجاني"
                  ? getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor.withOpacity(0.3),
                    )
                  : getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
            ),
            6.vs,
            Text(
              model.subTitle,
              style: model.title == "منتج مجاني"
                  ? getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.accentColor.withOpacity(0.3),
                    )
                  : getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.accentColor,
                    ),
            ),
            if (model.notAvailable?.isNotEmpty ?? false)
              Text(
                model.notAvailable!,
                style: getRegularTextStyle(
                  fontSize: 16,
                  color: AppColors.subTitleColor.withOpacity(0.3),
                ),
              ),
            1.vs,
          ],
        ),
      ),
    );
  }
}
