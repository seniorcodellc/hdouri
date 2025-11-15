import 'package:dartz/dartz.dart';
import '../../../../config/failures/failure.dart';
import '../../../../config/network/model/response_model.dart';
import '../../data/model/request_model/login_model.dart';
import '../../data/model/request_model/enter_phone_number_request_model.dart';
import '../../data/model/request_model/register_merchant_model.dart';
import '../../data/model/request_model/resend_code_request_model.dart';
import '../../data/model/request_model/reset_password_request_model.dart';
import '../../data/model/request_model/verify_request_model.dart';
import '../../data/model/request_model/tech_sign_up_model.dart';
import '../../data/model/response_model/login_response_model.dart';
import '../repositories/auth_repo.dart';

class AuthUseCase {
  AuthRepo authRepo;
  AuthUseCase({required this.authRepo});

  Future<Either<Failure, ResponseModel>> login({
    required LoginModel login,
  }) async => authRepo.login(login: login);

  Future<Either<Failure, ResponseModel>> logout() async => authRepo.logout();
  Future<Either<Failure, ResponseModel>> registerMerchant({
    required RegisterMerchantModel registerModel,
  }) async => authRepo.registerMerchant(registerModel: registerModel);
  /*Future<Either<Failure, ResponseModel>> verify(
          {required VerifyRequestModel verifyRequestModel}) async =>
      authRepo.verify(verifyRequestModel: verifyRequestModel);*/
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  }) async => authRepo.forgetPassword(
    enterPhoneNumberRequestModel: enterPhoneNumberRequestModel,
  );
  Future<Either<Failure, ResponseModel>> registerTech({
    required TechSignUpModel techSignUpModel,
  }) async => authRepo.registerTech(techSignUpModel: techSignUpModel);
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({
    required VerifyRequestModel verifyRequestModel,
  }) async =>
      authRepo.verifyForgetPassword(verifyRequestModel: verifyRequestModel);
  Future<Either<Failure, ResponseModel>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async => authRepo.resetPassword(
    resetPasswordRequestModel: resetPasswordRequestModel,
  );
  Future<Either<Failure, ResponseModel>> reSendCode({
    required ReSendRequestModel resendRequestModel,
  }) async => authRepo.reSendCode(resendRequestModel: resendRequestModel);
  Future<Either<Failure, ResponseModel>> editProfile({
    required UserModel userEdit,
  }) => authRepo.editProfile(userEdit: userEdit);
  // Future<Either<Failure, ResponseModel>> changeNumber(
  //         {required EnterPhoneNumberRequestModel
  //             enterPhoneNumberRequestModel}) async =>
  //     authRepo.changeNumber(
  //         enterPhoneNumberRequestModel: enterPhoneNumberRequestModel);

  Future<Either<Failure, ResponseModel>> deleteAccount({
    required int accountId,
  }) => authRepo.deleteAccount(accountId: accountId);
  // Future<Either<Failure, ResponseModel>> setLocation(
  //         {required String addressName,
  //         required double lat,
  //         required double long}) =>
  //     authRepo.setLocation(addressName: addressName, lat: lat, long: long);

  Future<Either<Failure, ResponseModel>> getUser() => authRepo.getUser();
  Future<Either<Failure, ResponseModel>> clearUser() => authRepo.clearUser();
}
