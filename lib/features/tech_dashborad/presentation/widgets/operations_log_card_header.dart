import 'package:hdouri/features/tech_dashborad/presentation/widgets/scan_blue_circle.dart';

import '../../../../exports.dart';
import '../../data/models/operations_log_model.dart';

class OperationsLogCardHeader extends StatelessWidget {
  const OperationsLogCardHeader({super.key, required this.model});
  final OperationsLogModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScanBlueCircle(),
        8.hs,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.title),
            Row(
              children: [
                CustomSVGImage(asset: AppAssets.grayCalendar),
                8.hs,
                Text(model.date),
              ],
            ),
          ],
        ),
        Spacer(),
        Container(
          width: 92.w,
          height: 27.h,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              "${model.points} + نقطة",
              style: getRegularTextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
