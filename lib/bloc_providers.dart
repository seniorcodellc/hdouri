import "package:cherubini/core/history/presentation/manager/history_cubit.dart";
import "package:cherubini/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart";
import "package:cherubini/features/on_boarding/presentation/managers/onboarding_manager_cubit.dart";

import "core/profile/domain/use_cases/profile_use_cases.dart";
import "core/profile/presentation/manager/profile_cubit.dart";
import "exports.dart";
import "features/authentication/presentation/managers/auth_cubit.dart";

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<OnboardingManagerCubit>(
      create: (context) => ServiceLocator().getIt<OnboardingManagerCubit>(),
    ),

    BlocProvider<AuthCubit>(
        create: (context) => ServiceLocator().getIt<AuthCubit>()),
    BlocProvider<HistoryCubit>(
        create: (context) => ServiceLocator().getIt<HistoryCubit>()..getList()),
    BlocProvider<ProfileCubit>(
        create: (context) => ServiceLocator().getIt<ProfileCubit>()..getData()),
  BlocProvider<BottomNavOperationCubit>(
        create: (context) => ServiceLocator().getIt<BottomNavOperationCubit>()),
    /*    BlocProvider<LanguageCubit>(create: (context) => ServiceLocator().getIt<LanguageCubit>()),

 */
    /*   BlocProvider<BottomNavOperationCubit>(
        create: (context) => BottomNavOperationCubit()),*/
    /*
    BlocProvider<AuthCubit>(
        create: (context) => ServiceLocator().getIt<AuthCubit>()),

    BlocProvider<BottomNavOperationCubit>(create: (context) => BottomNavOperationCubit()),
    BlocProvider<ConfigurationCubit>(create: (context) => ServiceLocator().getIt<ConfigurationCubit>()),
    BlocProvider<CompanyCubit>(
      create: (context) => CompanyCubit(companyUseCases: ServiceLocator().getIt<CompanyUseCases>())..getList(),
    ),   BlocProvider<InsurancePolicyCubit>(
      create: (context) => InsurancePolicyCubit(insurancePolicyUseCases: ServiceLocator().getIt<InsurancePolicyUseCases>()),
    ),*/
  ];
}
