import 'package:cherubini/features/tech_dashborad/data/models/points_register_model.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_small_white_container.dart';

import '../../../../exports.dart';

class TechPointsRegisterItem extends StatelessWidget {
  const TechPointsRegisterItem({super.key, required this.model});
  final PointsRegisterModel model;
  @override
  Widget build(BuildContext context) {
    return SharedSmallWhiteContainer(
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: model.bgColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CustomSVGImage(asset: model.asset, fit: BoxFit.none),
          ),
          16.hs,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: getRegularTextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              Text(
                model.date,
                style: getRegularTextStyle(
                  color: AppColors.grayHint,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            model.points,
            style: getRegularTextStyle(fontSize: 16, color: model.pointsColor),
          ),
        ],
      ),
    );
  }
}
