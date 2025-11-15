import 'package:hdouri/features/tech_dashborad/data/statics/tech_points_register_static.dart';
import 'package:hdouri/features/tech_dashborad/presentation/widgets/tech_points_register_item.dart';

import '../../../../exports.dart';

class PointsRegister extends StatelessWidget {
  const PointsRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 30.h),
      child: Column(
        children: List.generate(
          TechPointsRegisterStatic.pointsRegisterList.length,
          (index) {
            final model = TechPointsRegisterStatic.pointsRegisterList[index];
            return TechPointsRegisterItem(model: model);
          },
        ),
      ),
    );
  }
}
