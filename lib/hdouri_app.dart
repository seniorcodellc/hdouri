import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:country_picker/country_picker.dart';
import 'exports.dart';

class HdouriApp extends StatefulWidget {
  const HdouriApp({super.key});

  @override
  State<HdouriApp> createState() => _HdouriAppState();
}

class _HdouriAppState extends State<HdouriApp> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: _buildApp(context),
    );
  }

  _buildApp(BuildContext context) => GestureDetector(
    onTap: () => hideKeyboard,
    child: MaterialApp(
      locale: context.locale,
      themeMode: ThemeMode.light,

      builder: DevicePreview.appBuilder,
      title: AppStrings.appName.trans,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      navigatorKey: navigatorKey,
      color: AppColors.primaryColor,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.bgColor),
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
