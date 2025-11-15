import 'dart:async';
import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';

import '../../../../config/local_notification/local_notification.dart';
import '../../../../exports.dart';

import '../../../authentication/data/model/response_model/login_response_model.dart';
import '../../../authentication/presentation/managers/auth_cubit.dart';
import '../manager/get_configration_cubit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Counter to track timer ticks
  int counter = 0;

  // Stores the route name for navigation after the splash screen
  String? route;
  bool? isNotificationEnabled;
  Timer? timer;
  // bool? isNotificationEnabled;
  nextScreen() {
    timer = Timer.periodic(1.seconds, (timer) {
      counter++;
      if (route.isNotNull && counter >= 5) {
        route!.moveToAndRemoveCurrent(); // Navigate and remove splash screen
        timer.cancel();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bool isNew = await getBlocData<OnboardingManagerCubit>().isNewInstalled();
      if (isNew.isTrue) {
        isNotificationEnabled = await checkNotificationPermissionAndDoOperation(
          context,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
              title: AppStrings.splashHeaderAr,
              description: AppStrings.appDescriptionAr,
            );
          },
        );
        route = Routes.onBoardingRoute;
      } else {
        UserModel? user = await getBlocData<AuthCubit>().getUser();
        print("tokkkkkkkkk  ${user?.token}");
        if (user.isNotNull) {
          route = Routes.merchantDashboardRoute;
        } else {
          route = Routes.loginRoute;
        }
      }
    });
  }

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.gradientColorStart,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientColorStart,
                  AppColors.gradientColorEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPngImage(image: AppAssets.splashImage),
              32.vs,
              Text(
                AppStrings.appNameAr,
                style: getSemiBoldTextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                ),
              ),
              8.vs,
              Text(
                AppStrings.splashBodyAr,
                style: getRegularTextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
