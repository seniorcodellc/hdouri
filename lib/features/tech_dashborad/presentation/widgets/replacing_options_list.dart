import 'package:cherubini/features/tech_dashborad/data/models/replaced_choices_model.dart';
import 'package:cherubini/features/tech_dashborad/data/statics/replaced_choices_static.dart';
import 'package:cherubini/features/tech_dashborad/presentation/widgets/replaced_choices_list_item.dart';

import '../../../../exports.dart';

class ReplacingOptionsList extends StatelessWidget {
  const ReplacingOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: getPadding(horizontal: 16.w),
      crossAxisCount: 2,
      // childAspectRatio: 0.90,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisSpacing: 16.h,
      mainAxisSpacing: 15.w,
      children: List.generate(
        ReplacedChoicesStatic.replacedChoicesList.length,
        (index) {
          final model = ReplacedChoicesStatic.replacedChoicesList[index];
          return ReplacedChoicesListItem(model: model);
        },
      ),
    );
  }
}
