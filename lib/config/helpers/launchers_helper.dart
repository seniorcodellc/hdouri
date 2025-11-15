import 'package:hdouri/config/extensions/extensions.dart';
import 'package:hdouri/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../config/constants/enums.dart';
import 'alerts_helper.dart';

enum Schemes { sms, tel, email, browser, whatsapp }

Map<Schemes, String?> getScheme = {
  Schemes.tel: 'tel',
  Schemes.sms: 'sms',
  Schemes.email: 'mailto',
  Schemes.whatsapp: 'whatsapp',
  Schemes.browser: 'https',
};

Future goToAnotherApp(String? url, {Schemes scheme = Schemes.browser}) async {
  print("urllllllll $url");
  if (url.isNotNull) {
    Uri? uri;
    if (scheme == Schemes.whatsapp) {
      final link = WhatsAppUnilink(
        phoneNumber: '+$url',
        text: "Hey! I'm inquiring about the apartment listing",
      );
      bool isLaunched = await launchUrl(link.asUri());
      showLaunchState(isLaunched);
    } else {
      if (scheme == Schemes.browser) {
        if (url!.contains('https')) {
          uri = Uri.parse(url);
          print('uri $uri');
        }
      } else {
        uri = Uri(scheme: getScheme[scheme], path: url);
        print(uri);
      }

      if (await canLaunchUrl(uri!)) {
        bool isLaunched = await launchUrl(uri);
        showLaunchState(isLaunched);
      } else {
        showSnackBar(
          message: AppStrings.urlLaunchError.trans,
          alertType: AlertTypes.error,
        );
      }
    }
  } else {
    showSnackBar(
      message: AppStrings.urlLaunchError.trans,
      alertType: AlertTypes.error,
    );
  }
}

void showLaunchState(bool isLaunched) {
  if (isLaunched.isTrue) {
    showSnackBar(message: AppStrings.urlLaunchedSuccessfully.trans, alertType: AlertTypes.success);
  } else {
    showSnackBar(message: AppStrings.urlLaunchError.trans, alertType: AlertTypes.error);
  }
}
