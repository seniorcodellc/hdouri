import 'package:hdouri/features/authentication/data/model/request_model/tech_sign_up_model.dart';
import 'package:hdouri/features/authentication/data/model/response_model/tech_sign_up_response_model.dart';

import 'package:hdouri/features/authentication/data/model/request_model/register_merchant_model.dart';

import '../../../../exports.dart';
import '../model/request_model/login_model.dart';
import '../model/response_model/login_response_model.dart';
import '../model/request_model/enter_phone_number_request_model.dart';
import '../model/request_model/resend_code_request_model.dart';
import '../model/request_model/reset_password_request_model.dart';
import '../model/request_model/verify_request_model.dart';
import '../model/response_model/forget_password_response_model.dart';
import '../model/response_model/logout_response_model.dart';
import '../model/response_model/register_merchant_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseModel> login({required LoginModel login});
  Future<ResponseModel> logout();
  Future<ResponseModel> registerMerchant({
    required RegisterMerchantModel registerModel,
  });
  Future<ResponseModel> verify({
    required VerifyRequestModel verifyRequestModel,
  });
  Future<ResponseModel> forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  });
  //  Future<ResponseModel> verifyForgetPassword({required VerifyRequestModel verifyRequestModel});
  Future<ResponseModel> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  });
  //  Future<ResponseModel> reSendCode({required ReSendRequestModel resendRequestModel});
  Future<ResponseModel> registerTech({
    required TechSignUpModel techSignUpModel,
  });
  // Future<ResponseModel> editProfile({required UserModel userEdit});
  Future<ResponseModel> deleteAccount({required int accountId});
  // Future<ResponseModel> changeNumber({required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel});
}

class AuthRemoteDataSourceImpl extends RequestsImpl
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required super.dioConsumer});
  @override
  Future<ResponseModel> login({required LoginModel login}) => postRequest(
    endPoint: EndPoints.login,
    data: login.toJson(),
    getFromJsonFunction: UserResponseModel.fromJson,
  );
  @override
  Future<ResponseModel> logout() => postRequest(
    endPoint: EndPoints.logout,
    getFromJsonFunction: ResponseModel.fromJson,
  );
  @override
  Future<ResponseModel> registerMerchant({
    required RegisterMerchantModel registerModel,
  }) => postRequest(
    endPoint: EndPoints.registerMerchant,
    data: registerModel.toJson(),
    //  isFormData: true,
    getFromJsonFunction: RegisterMerchantResponseModel.fromJson,
  );
  @override
  Future<ResponseModel> registerTech({
    required TechSignUpModel techSignUpModel,
  }) => postRequest(
    endPoint: EndPoints.registerTech,
    data: techSignUpModel.toJson(),
    //  isFormData: true,
    getFromJsonFunction: TechSignUpResponseModel.fromJson,
  );

  @override
  Future<ResponseModel> verify({
    required VerifyRequestModel verifyRequestModel,
  }) => postRequest(
    endPoint: EndPoints.verify,
    data: verifyRequestModel.toJson(),
    getFromJsonFunction: UserResponseModel.fromJson,
  );
  @override
  Future<ResponseModel> forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  }) => postRequest(
    endPoint: EndPoints.forgetPassword,
    data: enterPhoneNumberRequestModel.toJson(),
    getFromJsonFunction: ForgetPasswordResponseModel.fromJson,
  );
  /*  @override
  Future<ResponseModel> verifyForgetPassword({
    required VerifyRequestModel verifyRequestModel,
  }) => addData(
    endPoint: EndPoints.verifyForgetPassword,
    data: verifyRequestModel.toJson(),
    getFromJsonFunction: RequestIdResponseModel.fromJson,
  );*/
  @override
  Future<ResponseModel> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) => postRequest(
    endPoint: EndPoints.resetPassword,
    data: resetPasswordRequestModel.toJson(),
    getFromJsonFunction: ResponseModel.fromJson,
  );
  /*  @override
  Future<ResponseModel> reSendCode({
    required ReSendRequestModel resendRequestModel,
  }) => addData(
    endPoint: EndPoints.reSend,
    data: resendRequestModel.toJson(),
    getFromJsonFunction: RequestIdResponseModel.fromJson,
  );*/
  /*  @override
  Future<ResponseModel> editProfile({required UserModel userEdit}) => updateData(
    endPoint: "${EndPoints.login}/${userEdit.id}",
    data: userEdit.toJson(),
    isFormData: true,
    getFromJsonFunction: RequestIdResponseModel.fromJson,
  );*/

  @override
  Future<ResponseModel> deleteAccount({required int accountId}) =>
      remoteExecute(
        request: dioConsumer.deleteRequest(
          path: "${EndPoints.deleteAccount}/$accountId",
        ),
        fromJsonFunction: ResponseModel.fromJson,
      );

  // @override

  // @override

  // @override
  // Future<ResponseModel> changeNumber({required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel}) => remoteExecute(
  //     request: dioConsumer.postRequest(
  //       path: EndPoints.changePhone,
  //       body: enterPhoneNumberRequestModel.toJson(),
  //     ),
  //     fromJsonFunction: ChangeNumberResponseModel.fromJson);
}
