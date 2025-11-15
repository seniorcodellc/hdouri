import 'cherubini_app.dart';
import 'exports.dart';

void main() async {
  await init;
  runApp(CustomEasyLocalization(child: CherubiniApp()));
}

Future get init async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  await ServiceLocator().init;
  await ScreenUtil.ensureScreenSize();

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseService().init;
  // SocketService().connect;
  //hideAndroidBottomControlBar;

  // initialize all dependencies
  await EasyLocalization.ensureInitialized();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}