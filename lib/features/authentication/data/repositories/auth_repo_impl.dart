import 'package:cherubini/features/authentication/data/model/request_model/tech_sign_up_model.dart';
import '../../../../config/constants/app_prefs.dart';
import '../../../../exports.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_source/local_auth_data_source.dart';
import '../data_source/remote_auth_data_source.dart';
import '../model/request_model/login_model.dart';
import '../model/request_model/edit_model.dart';
import '../model/request_model/enter_phone_number_request_model.dart';
import '../model/request_model/register_merchant_model.dart';
import '../model/request_model/resend_code_request_model.dart';
import '../model/request_model/reset_password_request_model.dart';
import '../model/request_model/verify_request_model.dart';
import '../model/response_model/login_response_model.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, ResponseModel>> login({required LoginModel login}) =>
      executeImpl<UserModel>(
        () => authRemoteDataSource.login(login: login),
        localWrite: (data) => authLocalDataSource.cacheUser(user: data),
      );
  @override
  Future<Either<Failure, ResponseModel>> logout() => executeImpl<Null>(
    () => authRemoteDataSource.logout(),
    localWrite: (data) => authLocalDataSource.clearUser(),
  );
  @override
  Future<Either<Failure, ResponseModel>> registerMerchant({
    required RegisterMerchantModel registerModel,
  }) => executeImpl<UserModel>(
    () => authRemoteDataSource.registerMerchant(registerModel: registerModel),
  );

  @override
  Future<Either<Failure, ResponseModel>> registerTech({
    required TechSignUpModel techSignUpModel,
  }) => executeImpl(
    () => authRemoteDataSource.registerTech(techSignUpModel: techSignUpModel),
  );
  @override
  @override
  Future<Either<Failure, ResponseModel>> verify({
    required VerifyRequestModel verifyRequestModel,
  }) => executeImpl<UserModel>(
    () => authRemoteDataSource.verify(verifyRequestModel: verifyRequestModel),
    localWrite: (data) async => authLocalDataSource.cacheUser(user: data),
  );
  @override
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  }) => executeImpl(
    () => authRemoteDataSource.forgetPassword(
      enterPhoneNumberRequestModel: enterPhoneNumberRequestModel,
    ),
  );

  /*
  @override
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({
    required VerifyRequestModel verifyRequestModel,
  }) => executeImpl(
    () => authRemoteDataSource.verifyForgetPassword(
      verifyRequestModel: verifyRequestModel,
    ),
  );
*/

  @override
  Future<Either<Failure, ResponseModel>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) => executeImpl(
    () => authRemoteDataSource.resetPassword(
      resetPasswordRequestModel: resetPasswordRequestModel,
    ),
  );
  /*  @override
  Future<Either<Failure, ResponseModel>> reSendCode({
    required ReSendRequestModel resendRequestModel,
  }) => executeImpl(
    () =>
        authRemoteDataSource.reSendCode(resendRequestModel: resendRequestModel),
  );*/
  /*  @override
  Future<Either<Failure, ResponseModel>> editProfile({
    required UserModel userEdit,
  }) => executeImpl<UserModel>(
    () => authRemoteDataSource.editProfile(userEdit: userEdit),
    */ /*       localWrite: (data) async {
        return authLocalDataSource.cacheUser(user: data..token=AppPrefs.token);
      }*/ /*
  );*/

  @override
  Future<Either<Failure, ResponseModel>> deleteAccount({
    required int accountId,
  }) => executeImpl<Null>(
    () => authRemoteDataSource.deleteAccount(accountId: accountId),
    localWrite: (data) async {
      return authLocalDataSource.clearUser();
    },
  );

  //
  // @override
  // Future<Either<Failure, ResponseModel>> changeNumber({required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel}) =>
  //     executeImpl(
  //       () => authRemoteDataSource.changeNumber(enterPhoneNumberRequestModel: enterPhoneNumberRequestModel),
  //     );

  @override
  Future<Either<Failure, ResponseModel>> getUser() =>
      executeCache(() => authLocalDataSource.getUser());

  @override
  Future<Either<Failure, ResponseModel>> clearUser() =>
      executeCache(() => authLocalDataSource.clearUser());

  @override
  Future<Either<Failure, ResponseModel>> editProfile({
    required UserModel userEdit,
  }) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ResponseModel>> reSendCode({
    required ReSendRequestModel resendRequestModel,
  }) {
    // TODO: implement reSendCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({
    required VerifyRequestModel verifyRequestModel,
  }) {
    // TODO: implement verifyForgetPassword
    throw UnimplementedError();
  }
}
