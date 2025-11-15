
import '../../exports.dart';


get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();
ArabicNumbers arabicNumber = ArabicNumbers();
get hideAndroidBottomControlBar => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
