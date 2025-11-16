import 'package:get_it/get_it.dart';
import 'exports.dart';

import 'features/authentication/data/data_source/governorates_remote_datasource.dart';
import 'features/authentication/data/data_source/local_auth_data_source.dart';
import 'features/authentication/data/data_source/merchant_list_remote_data_source.dart';
import 'features/authentication/data/data_source/remote_auth_data_source.dart';
import 'features/authentication/data/repositories/auth_repo_impl.dart';
import 'features/authentication/data/repositories/governorates_repo_impl.dart';
import 'features/authentication/data/repositories/merchant_list_repo_impl.dart';
import 'features/authentication/domain/repositories/auth_repo.dart';
import 'features/authentication/domain/repositories/governorates_repo.dart';
import 'features/authentication/domain/repositories/merchant_list_repo.dart';
import 'features/authentication/domain/usecase/auth_use_case.dart'
    show AuthUseCase;
import 'features/authentication/domain/usecase/governorates_use_cases.dart';
import 'features/authentication/domain/usecase/merchant_list_use_cases.dart';
import 'features/authentication/presentation/managers/auth_cubit.dart';
import 'features/authentication/presentation/managers/governorates_cubit.dart';
import 'features/authentication/presentation/managers/merchant_list_cubit.dart';
// import 'features/on_boarding/data/data_sources/onboarding_local_data_source.dart';
// import 'features/on_boarding/data/repositories/onboarding_repo_impl.dart';
// import 'features/on_boarding/domain/repositories/onboarding_repo.dart';
// import 'features/on_boarding/domain/usecase/onborading_usecases.dart';
// import 'features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';
// import 'features/technican_management/data/repositories/technician_repo_impl.dart';
// import 'features/technican_management/presentation/manager/technician_cubit.dart';

class ServiceLocator {
  GetIt getIt = GetIt.instance;

  /// Factory method that reuse same instance automatically

  static ServiceLocator instance =
      ServiceLocator._internal(); // named constructor

  /// Private constructor
  ServiceLocator._internal();

  factory ServiceLocator() => instance; // singleton
  Future<void> get init async {
    await registerPrefs;
    registerNetwork;
    registerPermission;
    // registerOnboarding;
    registerAuthDependencies;
    registerGovernorates;
    registerMerchantList;
    // registerTechniciansManagement;
    // registerBottomNavigation;
  }

  get registerAuthDependencies {
    getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(cache: getIt()),
    );
    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dioConsumer: getIt()),
    );
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        authLocalDataSource: getIt(),
        authRemoteDataSource: getIt(),
      ),
    );
    getIt.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(authRepo: getIt()),
    );
    getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authUseCase: getIt()),
    );
  }

  // get registerBottomNavigation {
  //   getIt.registerLazySingleton<BottomNavOperationCubit>(
  //     () => BottomNavOperationCubit(),
  //   );
  // }

  get registerGovernorates {
    getIt.registerLazySingleton<GovernoratesRemoteDataSource>(
      () => GovernoratesRemoteDatasourceImpl(dioConsumer: getIt()),
    );
    getIt.registerLazySingleton<GovernoratesRepo>(
      () => GovernoratesRepoImpl(governoratesRemoteDataSource: getIt()),
    );
    getIt.registerLazySingleton<GovernoratesUseCases>(
      () => GovernoratesUseCases(governoratesRepo: getIt()),
    );
    getIt.registerLazySingleton<GovernoratesCubit>(
      () => GovernoratesCubit(governoratesUseCases: getIt()),
    );
  }

  get registerMerchantList {
    getIt.registerLazySingleton<MerchantListRemoteDataSource>(
      () => MerchantListRemoteDataSourceImpl(dioConsumer: getIt()),
    );
    getIt.registerLazySingleton<MerchantListRepo>(
      () => MerchantListRepoImpl(merchantListRemoteDataSource: getIt()),
    );
    getIt.registerLazySingleton<MerchantListUseCases>(
      () => MerchantListUseCases(merchantListRepo: getIt()),
    );
    getIt.registerLazySingleton<MerchantListCubit>(
      () => MerchantListCubit(merchantListUseCases: getIt()),
    );
  }
  // get registerTechniciansManagement{
  //   getIt.registerLazySingleton<TechnicianRemoteDataSource>(() => TechnicianRemoteDataSourceImpl(dioConsumer: getIt()));
  //   getIt.registerLazySingleton<TechnicianRepo>(() => TechnicianRepoImpl(technicianRemoteDataSources: getIt()));
  //   getIt.registerLazySingleton<TechnicianUseCase>(() => TechnicianUseCase(technicianRepo: getIt()));
  //   getIt.registerLazySingleton<TechnicianCubit>(() => TechnicianCubit(technicianUseCase: getIt()));
  // }

  get registerNetwork {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
    getIt.registerLazySingleton<LogInterceptor>(
      () => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
    getIt.registerLazySingleton<DioConsumer>(
      () => DioConsumer(
        client: getIt(),
        dioInterceptor: getIt(),
        logInterceptor: getIt(),
      )..dioInit(),
    );
    /*********************************** end of network  ****************************************/
  }

  // get registerOnboarding {
  //   getIt.registerLazySingleton<OnBoardingLocalDataSource>(
  //     () => OnBoardingLocalDataSourceImplWithPrefs(cache: getIt()),
  //   );
  //   getIt.registerLazySingleton<OnBoardingRepo>(
  //     () => OnBoardingRepoImpl(onBoardingLocalDataSource: getIt()),
  //   );
  //   getIt.registerLazySingleton<OnBoardingUsesCases>(
  //     () => OnBoardingUsesCases(onBoardingRepo: getIt()),
  //   );
  //   getIt.registerLazySingleton<OnboardingManagerCubit>(
  //     () => OnboardingManagerCubit(onBoardingUsesCases: getIt()),
  //   );
  // }

  get registerPrefs async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => preferences);
    getIt.registerLazySingleton<CacheAbstract>(
      () => CacheImpl(sharedPreferences: getIt<SharedPreferences>()),
    );
  }

  get registerPermission =>
      getIt.registerLazySingleton(() => PermissionManager());
}
