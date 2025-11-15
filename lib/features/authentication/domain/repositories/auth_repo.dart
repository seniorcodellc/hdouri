import '../../../../exports.dart';
import '../../data/model/request_model/login_model.dart';
import '../../data/model/request_model/enter_phone_number_request_model.dart';
import '../../data/model/request_model/register_merchant_model.dart';
import '../../data/model/request_model/resend_code_request_model.dart';
import '../../data/model/request_model/reset_password_request_model.dart';
import '../../data/model/request_model/verify_request_model.dart';
import '../../data/model/request_model/tech_sign_up_model.dart';
import '../../data/model/response_model/login_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, ResponseModel>> login({required LoginModel login});
  Future<Either<Failure, ResponseModel>> logout();
  Future<Either<Failure, ResponseModel>> registerMerchant({
    required RegisterMerchantModel registerModel,
  });
  // Future<Either<Failure, ResponseModel>> verify({required VerifyRequestModel verifyRequestModel});
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  });
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({
    required VerifyRequestModel verifyRequestModel,
  });
  Future<Either<Failure, ResponseModel>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  });
  Future<Either<Failure, ResponseModel>> reSendCode({
    required ReSendRequestModel resendRequestModel,
  });
  Future<Either<Failure, ResponseModel>> editProfile({
    required UserModel userEdit,
  });
  Future<Either<Failure, ResponseModel>> deleteAccount({
    required int accountId,
  });
  Future<Either<Failure, ResponseModel>> registerTech({
    required TechSignUpModel techSignUpModel,
  });
  // Future<Either<Failure, ResponseModel>> changeNumber({required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel});
  Future<Either<Failure, ResponseModel>> getUser();
  Future<Either<Failure, ResponseModel>> clearUser();
}
