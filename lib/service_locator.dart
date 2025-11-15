import 'package:cherubini/core/profile/presentation/manager/profile_cubit.dart';
import 'package:cherubini/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:cherubini/features/technican_management/data/data_sources/technician_remote_data_sources.dart';
import 'package:cherubini/features/technican_management/domain/repositories/technician_repo.dart';
import 'package:cherubini/features/technican_management/domain/use_cases/technician_use_case.dart';
import 'package:get_it/get_it.dart';
import 'core/history/data/data_sources/history_remote_datasource.dart';
import 'core/history/data/repositories/history_repo_impl.dart';
import 'core/history/domain/repositories/histroy_repo.dart';
import 'core/history/domain/use_cases/history_use_cases.dart';
import 'core/history/presentation/manager/history_cubit.dart';
import 'core/profile/data/data_sources/profile_remote_data_source.dart';
import 'core/profile/data/repositories/profile_repo_impl.dart';
import 'core/profile/domain/repositories/profile_repo.dart';
import 'core/profile/domain/use_cases/profile_use_cases.dart';
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
import 'features/authentication/domain/usecase/auth_use_case.dart' show AuthUseCase;
import 'features/authentication/domain/usecase/governorates_use_cases.dart';
import 'features/authentication/domain/usecase/merchant_list_use_cases.dart';
import 'features/authentication/presentation/managers/auth_cubit.dart';
import 'features/authentication/presentation/managers/governorates_cubit.dart';
import 'features/authentication/presentation/managers/merchant_list_cubit.dart';
import 'features/on_boarding/data/data_sources/onboarding_local_data_source.dart';
import 'features/on_boarding/data/repositories/onboarding_repo_impl.dart';
import 'features/on_boarding/domain/repositories/onboarding_repo.dart';
import 'features/on_boarding/domain/usecase/onborading_usecases.dart';
import 'features/on_boarding/presentation/managers/onboarding_manager_cubit.dart';
import 'features/technican_management/data/repositories/technician_repo_impl.dart';
import 'features/technican_management/presentation/manager/technician_cubit.dart';

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
    registerOnboarding;
    registerAuthDependencies;
    registerGovernorates;
    registerProfile;
    registerHistory;
    registerMerchantList;
    registerTechniciansManagement;
    registerBottomNavigation;
  }
  get registerAuthDependencies {
    getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(cache: getIt()));
    getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authLocalDataSource: getIt(), authRemoteDataSource: getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(authRepo: getIt()));
    getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(authUseCase: getIt()));
  }  get registerBottomNavigation {
     getIt.registerLazySingleton<BottomNavOperationCubit>(() =>
        BottomNavOperationCubit());
  }
  get registerGovernorates {
    getIt.registerLazySingleton<GovernoratesRemoteDataSource>(() => GovernoratesRemoteDatasourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GovernoratesRepo>(() => GovernoratesRepoImpl(governoratesRemoteDataSource: getIt()));
    getIt.registerLazySingleton<GovernoratesUseCases>(() => GovernoratesUseCases(governoratesRepo: getIt()));
    getIt.registerLazySingleton<GovernoratesCubit>(() => GovernoratesCubit(governoratesUseCases: getIt()));
  }
  get registerMerchantList{
    getIt.registerLazySingleton<MerchantListRemoteDataSource>(() => MerchantListRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<MerchantListRepo>(() => MerchantListRepoImpl(merchantListRemoteDataSource: getIt()));
    getIt.registerLazySingleton<MerchantListUseCases>(() => MerchantListUseCases(merchantListRepo: getIt()));
    getIt.registerLazySingleton<MerchantListCubit>(() => MerchantListCubit(merchantListUseCases: getIt()));
  }  get registerTechniciansManagement{
    getIt.registerLazySingleton<TechnicianRemoteDataSource>(() => TechnicianRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<TechnicianRepo>(() => TechnicianRepoImpl(technicianRemoteDataSources: getIt()));
    getIt.registerLazySingleton<TechnicianUseCase>(() => TechnicianUseCase(technicianRepo: getIt()));
    getIt.registerLazySingleton<TechnicianCubit>(() => TechnicianCubit(technicianUseCase: getIt()));
  }

  get registerHistory {
    getIt.registerLazySingleton<HistoryRemoteDataSource>(() => HistoryRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<HistoryRepo>(() => HistoryRepoImpl(historyRemoteDataSource: getIt()));
    getIt.registerLazySingleton<HistoryUseCases>(() => HistoryUseCases(historyRepo: getIt()));
    getIt.registerLazySingleton<HistoryCubit>(() => HistoryCubit(historyUseCases: getIt()));
  }
  get registerProfile {
    getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileRemoteDataSource: getIt()));
    getIt.registerLazySingleton<ProfileUseCases>(() => ProfileUseCases(profileRepo: getIt()));
    getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(profileUseCases: getIt()));
  }

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

  get registerOnboarding {
    getIt.registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImplWithPrefs(cache: getIt()),
    );
    getIt.registerLazySingleton<OnBoardingRepo>(
      () => OnBoardingRepoImpl(onBoardingLocalDataSource: getIt()),
    );
    getIt.registerLazySingleton<OnBoardingUsesCases>(
      () => OnBoardingUsesCases(onBoardingRepo: getIt()),
    );
    getIt.registerLazySingleton<OnboardingManagerCubit>(
      () => OnboardingManagerCubit(onBoardingUsesCases: getIt()),
    );
  }

  get registerPrefs async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => preferences);
    getIt.registerLazySingleton<CacheAbstract>(
      () => CacheImpl(sharedPreferences: getIt<SharedPreferences>()),
    );
  }
  get registerPermission => getIt.registerLazySingleton(() => PermissionManager());

}
