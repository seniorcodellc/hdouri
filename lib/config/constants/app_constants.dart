import 'package:cherubini/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstants {
  static const String egyptDialCode = "+20";
  static int maxYears = 20;
  static double defaultElevation = 4;
  static const String empty = '';
  static const String moyasar = 'pk_test_8Er2TTtA5sv2pz8KC386GyS38Zy8rK1G21mFb7KX';
  static const double circleRadius = 18;
  static const dialogLongDuration = 2500;
  static const dialogShortDuration = 2000;
  static const int one = 1;
  static const int otpLength = 4;
  static const int nShimmerItems = 6;
  static int shimmerItems = 4;
  static int shortLengthShimmers = 2;
  static int largeLengthShimmers = 10;
  static const longDuration = 1000;
  static const shortDuration = 2000;
  static int passwordLength = 8;
  static const int zero = 0;

  static int splashScreenDuration = 5;

  static var logoAnimationDuration = 3;
  LatLng countryLatLng = const LatLng(23.8859, 45.0792);

  static int mapRadius = 1000;

  static var country = "sa";
  static const String googleMapApiKey = "AIzaSyCeqfLXwLMUQs4CthXrETuanYwYxDpTM0k";
  static const int pageSize = 10;
  static const Duration connectTimeOut = Duration(minutes: 10);
  static const Duration sendTimeOut = Duration(minutes: 10);
  static const Duration receiveTimeOut = Duration(minutes: 10);
  static EdgeInsetsGeometry kSTEPDirectionalPadding =
  EdgeInsetsDirectional.fromSTEB(16.w, 25.h, 16.w, 0.h);
  static const kCommonAnimationDuration = Duration(milliseconds: 200);
}
