import 'package:cherubini/exports.dart';
import 'package:cherubini/features/tech_dashborad/data/models/tech_scan_model.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/scan_blue_circle.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/shared_small_white_container.dart';

class TechLastScanItem extends StatelessWidget {
  const TechLastScanItem({super.key, required this.model});
  final TechScanModel model;

  @override
  Widget build(BuildContext context) {
    return SharedSmallWhiteContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScanBlueCircle(),
          16.hs,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: getRegularTextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                model.date,
                style: getRegularTextStyle(
                  fontSize: 16.sp,
                  color: AppColors.grayHint,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                '${model.points} نقطه',
                style: getRegularTextStyle(
                  fontSize: 14.sp,
                  color: AppColors.accentColor,
                ),
              ),
              Text(
                '${model.points} 5 منتجات',
                style: getRegularTextStyle(
                  fontSize: 14.sp,
                  color: AppColors.subTitleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
