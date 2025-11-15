import 'package:hdouri/exports.dart';

import '../models/tech_settings_model.dart';

class TechSettingsDetailsStatic {
  static List<TechSettingsModel> techSettingsDetailsList = [
    TechSettingsModel(
      title: AppStrings.profileEditAr,
      asset: AppAssets.profile,
    ),
    TechSettingsModel(
      title: AppStrings.profileChangePasswordAr,
      asset: AppAssets.lock,
    ),
    TechSettingsModel(
      title: AppStrings.profileWarrantyCertificatesAr,
      asset: AppAssets.profile,
    ),
  ];
}
