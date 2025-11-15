import 'package:cherubini/core/history/domain/use_cases/history_use_cases.dart';
import 'package:cherubini/core/history/presentation/manager/history_cubit.dart';
import 'package:cherubini/core/profile/domain/use_cases/profile_use_cases.dart';
import 'package:cherubini/core/profile/presentation/manager/profile_cubit.dart';
import 'package:cherubini/features/authentication/presentation/managers/cities_cubit.dart';
import 'package:cherubini/features/authentication/presentation/managers/governorates_cubit.dart';
import 'package:cherubini/features/authentication/presentation/managers/merchant_list_cubit.dart';
import 'package:cherubini/features/merchant_points_summary/presentation/screens/merchant_points_summary.dart';
import 'package:cherubini/features/merchant_settings/presentation/screens/merchant_settings.dart';
import 'package:cherubini/features/on_boarding/presentation/screens/onboarding_screen.dart';
import 'package:cherubini/features/authentication/presentation/screens/sign_up_as_tech.dart';
import 'package:cherubini/features/authentication/presentation/screens/sign_up_as_trader.dart';
import 'package:cherubini/features/authentication/presentation/screens/register_accept_screen.dart';
import 'package:cherubini/features/scan/presentation/screens/error_scan_screen.dart';
import 'package:cherubini/features/scan/presentation/screens/scan_screen.dart';
import 'package:cherubini/features/scan/presentation/screens/success_scan_screen.dart';
import 'package:cherubini/features/tech_dashborad/presentation/screens/tech_dashboard.dart';
import 'package:cherubini/features/tech_dashborad/presentation/screens/tech_operations_log_screen.dart';
import 'package:cherubini/features/tech_dashborad/presentation/screens/tech_points_summary_screen.dart';
import 'package:cherubini/features/technican_management/domain/use_cases/technician_use_case.dart';
import 'package:cherubini/features/technican_management/presentation/manager/technician_cubit.dart';
import 'package:cherubini/features/warranty/presentation/screens/merchant_warranty_screen.dart';
import 'package:cherubini/features/warranty/presentation/screens/tech_warranty_screen.dart';

import 'package:nested/nested.dart';

import '../../exports.dart';

import '../../features/authentication/domain/usecase/merchant_list_use_cases.dart';
import '../../features/merchant_dashboard/presentation/screens/merchant_dashboard_screen.dart';
import '../../features/authentication/domain/usecase/governorates_use_cases.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/operation_details/presentation/screens/operation_details.dart';
import '../../features/operations_history/presentation/screens/operation_history.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';
import '../../features/tech_dashborad/presentation/screens/tech_settings_screen.dart';
import '../../features/technican_management/presentation/screens/technicians_management_screen.dart';

class RouteGenerator {
  AnimationType? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
  static Route<T>? generateRoute<T>(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return buildPageRoute<T>(child: SplashScreen(), routeSettings: routeSettings);
      case Routes.onBoardingRoute:
        return buildPageRoute<T>(child: OnboardingScreen(), routeSettings: routeSettings);
      case Routes.operationsHistoryRoute:
        return buildPageRoute<T>(child: OperationsHistoryScreen(), routeSettings: routeSettings);

      case Routes.merchantDashboardRoute:
        return buildPageRoute<T>(

          child: MerchantDashboardScreen(),
          routeSettings: routeSettings,
        );

      case Routes.techniciansManagementRoute:
        return buildPageRoute<T>(
            providers: [
              BlocProvider(create: (context) => TechnicianCubit(technicianUseCase: ServiceLocator().getIt<TechnicianUseCase>())..filterTechnicians(),)
            ],
            child: TechniciansManagementScreen(), routeSettings: routeSettings);
      case Routes.operationsDetailsRoute:
        return buildPageRoute<T>(child: OperationsDetailsScreen(), routeSettings: routeSettings);
      case Routes.merchantPointsSummary:
        return buildPageRoute<T>(child: MerchantPointsSummary(), routeSettings: routeSettings);
        return buildPageRoute<T>(child: OnboardingScreen(), routeSettings: routeSettings);
      case Routes.techniciansManagementRoute:
        return buildPageRoute<T>(child: TechniciansManagementScreen(), routeSettings: routeSettings);
      case Routes.scanRoute:
        return buildPageRoute<T>(child: ScanScreen(), routeSettings: routeSettings);
      case Routes.successScanRoute:
        return buildPageRoute<T>(child: SuccessScanScreen(), routeSettings: routeSettings);
      case Routes.errorScanRoute:
        return buildPageRoute<T>(child: ErrorScanScreen(), routeSettings: routeSettings);
      case Routes.merchantWarrantyRoute:
        return buildPageRoute<T>(child: MerchantWarrantyScreen(), routeSettings: routeSettings);
      case Routes.techWarrantyRoute:
        return buildPageRoute<T>(child: TechWarrantyScreen(), routeSettings: routeSettings);
      case Routes.loginRoute:
        return buildPageRoute<T>(
          providers: [BlocProvider<ErrorCubit>(create: (context) => ErrorCubit())],
          child: LoginScreen(),
        );
      case Routes.registerTechRoute:
        return buildPageRoute<T>(
          child: SignUpAsTech(),
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
            BlocProvider<MerchantListCubit>(
                create: (context)=>
                MerchantListCubit(merchantListUseCases: ServiceLocator().getIt<MerchantListUseCases>())..getList(),
            )
          ],
        );
      case Routes.registerTraderRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
            BlocProvider<GovernoratesCubit>(
              create: (context) =>
                  GovernoratesCubit(governoratesUseCases: ServiceLocator().getIt<GovernoratesUseCases>())..getList(),
            ),
            BlocProvider<CitiesCubit>(create: (context) => CitiesCubit()),
          ],
          child: SignUpAsTrader(),
        );
      case Routes.registerAccept:
        return buildPageRoute<T>(child: RegisterAcceptScreen());
      case Routes.techDashboard:
        return buildPageRoute<T>(child: TechDashboard());
      case Routes.techPointsSummary:
        return buildPageRoute<T>(child: TechPointsSummaryScreen());
      case Routes.settings:
        return buildPageRoute<T>(child: TechSettingsScreen());
      case Routes.merchantSettings:
        return buildPageRoute<T>(child: MerchantSettings());
      case Routes.operationsLog:
        return buildPageRoute<T>(child: TechOperationsLogScreen());

      /*
        case Routes.followUps:
        return buildPageRoute<T>(child: FollowUps(), routeSettings: routeSettings);
      case Routes.reservationDetails:
        return buildPageRoute<T>(child: ReservationDetails(), routeSettings: routeSettings);
      case Routes.consultationsRoute:
        return buildPageRoute<T>(child: ConsultationsScreen(), routeSettings: routeSettings);
      case Routes.reservationSteps:
        bool isConsultation = (routeSettings.arguments as Map<String, dynamic>)["isConsultation"];
        return buildPageRoute<T>(
          child: ReservationSteps(isConsultation: isConsultation.orTrue),
          routeSettings: routeSettings,
        );
      case Routes.myReservationsRoute:
        return buildPageRoute<T>(child: MyReservations(), routeSettings: routeSettings);
      case Routes.bottomNavRoute:
        return buildPageRoute<T>(child: BottomNavigationScreens(), routeSettings: routeSettings);
case Routes.insurances:
        return buildPageRoute<T>(child: InsurancesScreen(), routeSettings: routeSettings);
case Routes.addInsuranceMembers:
        return buildPageRoute<T>(child: AddInsuranceMembers(), routeSettings: routeSettings);
        case Routes.addInsuranceCompany:
        return buildPageRoute<T>(child: AddInsuranceCompany(), routeSettings: routeSettings);
      case Routes.creditCard:
        return buildPageRoute<T>(child: MasterCardScreen(), routeSettings: routeSettings);
      case Routes.completed:
        return buildPageRoute<T>(child: CompletedScreen(), routeSettings: routeSettings);

      case Routes.loginRoute:
        return buildPageRoute<T>(
          child: LoginScreen(),
          providers: [BlocProvider(create: (context) => ErrorCubit())],
          routeSettings: routeSettings,
        );

      case Routes.registerRoute:
        return buildPageRoute<T>(
          child: RegisterScreen(),
          routeSettings: routeSettings,
          providers: [BlocProvider(create: (context) => ErrorCubit())],
        );

      case Routes.enterOtpRoute:
        return buildPageRoute<T>(
          child: EnterOtpScreen(
            */
      /*         isForgetPassword: (routeSettings.arguments
                  as Map<String, dynamic>)["isForgetPassword"],
              phoneNumber:
                  (routeSettings.arguments as Map<String, dynamic>)["phone"],
              otpNumber: (routeSettings.arguments
                  as Map<String, dynamic>)["otpNumber"],
              userId:
                  (routeSettings.arguments as Map<String, dynamic>)["userId"],
              countryCode: (routeSettings.arguments
                  as Map<String, dynamic>)["countryCode"],*/ /*

          ),
          providers: [BlocProvider(create: (context) => ErrorCubit())],
          routeSettings: routeSettings,
        );
      case Routes.enterPhoneNumberRoute:
        return buildPageRoute<T>(
          child: ForgetPasswordScreen(
            isForgetPassword: (routeSettings.arguments as Map<String, dynamic>)["isForgetPassword"],
            userId: (routeSettings.arguments as Map<String, dynamic>)["userId"],
          ),
          routeSettings: routeSettings,
        );

      case Routes.resetPasswordRoute:
        return buildPageRoute<T>(
          child: ResetPasswordScreen(
            phone: (routeSettings.arguments as Map<String, dynamic>)["phone"],
            code: (routeSettings.arguments as Map<String, dynamic>)["code"],
            countryCode: (routeSettings.arguments as Map<String, dynamic>)["countryCode"],
          ),
          providers: [BlocProvider(create: (context) => ErrorCubit())],
          routeSettings: routeSettings,
        );
*/

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("No route defined for ${routeSettings.name}"))),
        );
    }
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    AnimationType? pageRouteAnimation = AnimationType.fade,
    Duration? duration,
    RouteSettings? routeSettings,
    List<SingleChildWidget>? providers,
  }) {
    if (providers.isNotNullOrEmpty) {
      child = MultiBlocProvider(providers: providers!, child: child);
    }
    if (pageRouteAnimation == AnimationType.rotate) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return RotationTransition(child: child, turns: ReverseAnimation(anim));
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.scale) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return ScaleTransition(child: child, scale: anim);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slide) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            child: child,
            position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(anim),
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slideBottomTop) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(anim),
            child: child,
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    }

    return PageRouteBuilder<T>(
      settings: routeSettings,
      transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      reverseTransitionDuration: const Duration(milliseconds: 50),
      pageBuilder: (context, a1, a2) => child,
      transitionsBuilder: (c, anim, a2, child) {
        return FadeTransition(opacity: anim, child: child);
      },
    );
  }
}
