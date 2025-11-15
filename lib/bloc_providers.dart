import "package:hdouri/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart";
import "exports.dart";
import "features/authentication/presentation/managers/auth_cubit.dart";

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(
      create: (context) => ServiceLocator().getIt<AuthCubit>(),
    ),
    BlocProvider<BottomNavOperationCubit>(
      create: (context) => ServiceLocator().getIt<BottomNavOperationCubit>(),
    ),
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
