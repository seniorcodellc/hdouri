

import 'config/constants/localization_constants.dart';
import 'exports.dart';

class CustomEasyLocalization extends StatelessWidget {
  final Widget child;
  const CustomEasyLocalization({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocalizationsConstants().supportedLocales,
      path: AppLocalizationsConstants().path, // <-- change the path of the translation files
      fallbackLocale:  AppLocalizationsConstants().arLocale,
      saveLocale: true,
      startLocale: AppLocalizationsConstants().arLocale,
      child: child,

      
    );
  }
}
