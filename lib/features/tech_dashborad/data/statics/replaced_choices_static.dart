import 'package:hdouri/features/tech_dashborad/data/models/replaced_choices_model.dart';

class ReplacedChoicesStatic {
  static List<ReplacedChoicesModel> replacedChoicesList = [
    ReplacedChoicesModel(subTitle: '1,000 نقطة', title: 'خصم 10%'),
    ReplacedChoicesModel(subTitle: '2,500 نقطة', title: 'خصم 25%'),

    ReplacedChoicesModel(subTitle: '5,000 نقطة', title: 'خصم 50%'),
    ReplacedChoicesModel(
      subTitle: '10,000 نقطة',
      title: 'منتج مجاني',
      notAvailable: "غير متاح حاليا",
    ),
  ];
}
