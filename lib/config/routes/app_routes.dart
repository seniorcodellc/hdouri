import 'package:hdouri/features/authentication/presentation/managers/cities_cubit.dart';
import 'package:hdouri/features/authentication/presentation/managers/governorates_cubit.dart';
import 'package:hdouri/features/authentication/presentation/managers/merchant_list_cubit.dart';

import 'package:hdouri/features/authentication/presentation/screens/sign_up_as_tech.dart';
import 'package:hdouri/features/authentication/presentation/screens/sign_up_as_trader.dart';
import 'package:hdouri/features/authentication/presentation/screens/register_accept_screen.dart';

import 'package:nested/nested.dart';

import '../../exports.dart';

import '../../features/authentication/domain/usecase/merchant_list_use_cases.dart';
import '../../features/authentication/domain/usecase/governorates_use_cases.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';

class RouteGenerator {
  AnimationType? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
  static Route<T>? generateRoute<T>(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.onBoardingRoute:
      //   return buildPageRoute<T>(child: OnboardingScreen(), routeSettings: routeSettings);

      case Routes.loginRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
          child: LoginScreen(),
        );
      case Routes.registerTechRoute:
        return buildPageRoute<T>(
          child: SignUpAsTech(),
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
            BlocProvider<MerchantListCubit>(
              create: (context) => MerchantListCubit(
                merchantListUseCases: ServiceLocator()
                    .getIt<MerchantListUseCases>(),
              )..getList(),
            ),
          ],
        );
      case Routes.registerTraderRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
            BlocProvider<GovernoratesCubit>(
              create: (context) => GovernoratesCubit(
                governoratesUseCases: ServiceLocator()
                    .getIt<GovernoratesUseCases>(),
              )..getList(),
            ),
            BlocProvider<CitiesCubit>(create: (context) => CitiesCubit()),
          ],
          child: SignUpAsTrader(),
        );
      case Routes.registerAccept:
        return buildPageRoute<T>(child: RegisterAcceptScreen());

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
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${routeSettings.name}"),
            ),
          ),
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
          return RotationTransition(
            child: child,
            turns: ReverseAnimation(anim),
          );
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
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
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
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
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
