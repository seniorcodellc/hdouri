import 'package:hdouri/exports.dart';
import '../../../../config/local_notification/local_notification.dart';
import '../../data/model/request_model/login_model.dart';
import '../../data/model/request_model/enter_phone_number_request_model.dart';
import '../../data/model/request_model/register_merchant_model.dart';
import '../../data/model/request_model/resend_code_request_model.dart';
import '../../data/model/request_model/reset_password_request_model.dart';
import '../../data/model/request_model/verify_request_model.dart';
import '../../data/model/request_model/tech_sign_up_model.dart';
import '../../data/model/response_model/forget_password_response_model.dart';
import '../../data/model/response_model/login_response_model.dart';
import '../../domain/usecase/auth_use_case.dart';

class AuthCubit extends Cubit<CubitStates> {
  AuthUseCase authUseCase;
  AuthCubit({required this.authUseCase}) : super(InitialState());

  //RequestIdModel? requestId;
  UserModel? user;

  login(LoginModel loginModel) =>executeWithDialog<UserModel?>(
      either: authUseCase.login(login: loginModel),
      startingMessage: AppStrings.signIn.trans,
      responseMessage: AppStrings.loggedInSuccessfully.trans,
      onSuccess: (UserModel? data) async {
        user = data;
        //     getBlocData<BottomNavOperationCubit>().changIndex(0);

        Routes.merchantDashboardRoute.moveTo();
        // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
      },
    );


  logout() async => await executeWithDialog<dynamic>(
    either: authUseCase.logout(),
    startingMessage: AppStrings.waitingForLogout.trans,
    onSuccess: (data) async {
      user = null;
      Routes.loginRoute.moveToCurrrentRouteAndRemoveAll;
      emit(LoadedState(data: null));
    },
  );

  registerTech(TechSignUpModel techSignUpModel) async {
    await executeWithDialog(
      either: authUseCase.registerTech(techSignUpModel: techSignUpModel),
      startingMessage: AppStrings.waitingForRegistration.trans,
      onSuccess: (data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
              title: AppStrings.verificationAccount.trans,
              description: AppStrings.pleaseWaitUntilApproved.trans,
            );
          },
        );
        Routes.registerAccept.moveTo();
      },
    );
  }

  registerMerchant(RegisterMerchantModel registerRequestModel) async {
    await executeWithDialog<UserModel>(
      either: authUseCase.registerMerchant(registerModel: registerRequestModel),
      startingMessage: AppStrings.waitingForRegistration.trans,
      onSuccess: (UserModel? data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
              title: AppStrings.verificationAccount.trans,
              description: AppStrings.pleaseWaitUntilApproved.trans,
            );
          },
        );
        Routes.registerAccept.moveTo();
      },
    );
  }

  /*  verify({
    required VerifyRequestModel verifyRequestModel,
    required bool isForgetPassword,
  }) async {
    await executeWithDialog<UserModel>(
      either: authUseCase.verify(verifyRequestModel: verifyRequestModel),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (UserModel? data) async {
        userModel = data?.userModel;
        //  getBlocData<BottomNavOperationCubit>().changIndex(0);
        Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
        // getUserAndToken(requestId!.requestId!);
        */ /*   isForgetPassword
            ? Routes.resetPasswordRoute.moveTo()
            : Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;*/ /*
      },
    );
  }*/

  /*  reSendCode({required ReSendRequestModel resendRequestModel}) async {
    await executeWithDialog<RequestIdModel>(
      either: authUseCase.reSendCode(resendRequestModel: resendRequestModel),
      startingMessage: AppStrings.sendAgain.trans,
      onSuccess: (RequestIdModel? data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            */ /*        NotificationsService().showSimpleNotification(
                title: AppStrings.verificationAccount.trans,
                description: data!.verificationCode.toString());*/ /*
          },
        );
      },
    );
  }*/

  forgetPassword({
    required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  }) async {
    await executeWithDialog<ForgetPasswordDataModel>(
      either: authUseCase.forgetPassword(
        enterPhoneNumberRequestModel: enterPhoneNumberRequestModel,
      ),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
              title: AppStrings.verificationAccount.trans,
              description: data!.confirmationCode.toString(),
            );
          },
        );
        Routes.enterOtpRoute.moveToAndRemoveCurrent(
          args: {
            "phone": enterPhoneNumberRequestModel.phoneNumber,
            "countryCode": enterPhoneNumberRequestModel.countryCode,
            "isForgetPassword": true,
          },
        );
      },
    );
  }

  verifyForgetPassword({required VerifyRequestModel verifyRequestModel}) async {
    await executeWithDialog(
      either: authUseCase.verifyForgetPassword(
        verifyRequestModel: verifyRequestModel,
      ),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        /*    Routes.resetPasswordRoute.moveToAndRemoveCurrent(args: {
          "phone": verifyRequestModel.phone,
          "countryCode": verifyRequestModel.countryCode,
          "code": verifyRequestModel.verifyCode,
        });*/
      },
    );
  }

  resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async {
    await executeWithDialog(
      either: authUseCase.resetPassword(
        resetPasswordRequestModel: resetPasswordRequestModel,
      ),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        Routes.loginRoute.moveToCurrrentRouteAndRemoveAll;
      },
    );
  }

  /*  editProfile({required UserModel userEdit}) {
    executeWithDialog<UserModel>(
      either: authUseCase.editProfile(userEdit: userEdit),
      startingMessage: AppStrings.waitingForEditProfile.trans,
      onSuccess: (data) {
        //userModel = data!.user;
        // getBlocData<BottomNavOperationCubit>().goToHome();
        emit(LoadedState(data: requestId));
      },
    );
  }*/

  // changeNumber(
  //     {required EnterPhoneNumberRequestModel enterPhoneNumberRequestModel,
  //     required bool isForgetPassword}) async {
  //   await executeWithDialog<ChangeNumberUserModel>(
  //     either: authUseCase.changeNumber(
  //         enterPhoneNumberRequestModel: enterPhoneNumberRequestModel),
  //     startingMessage: AppStrings.changeNumber.trans,
  //     onSuccess: (data) async {
  //       changeNumberUserModel = data!.user;
  //       Routes.enterOtpRoute.moveToWithArgs({
  //         "id": enterPhoneNumberRequestModel.id,
  //         "phone": enterPhoneNumberRequestModel.phoneNumber,
  //         'isForgetPassword': isForgetPassword
  //       });
  //     },
  //   );
  // }
  //

  /*  deleteAccount() => executeWithDialog(
    either: authUseCase.deleteAccount(accountId: userModel!.id!),
    startingMessage: AppStrings.deletingAccount.trans,
    onSuccess: (_) {
      requestId = null;
      //  getBlocData<BottomNavOperationCubit>().closeDrawer();
      emit(LoadedState(data: null));
      Routes.bottomNavRoute.moveTo();
    },
  );*/

  Future<UserModel?> getUser() async => managerExecute<UserModel>(
    authUseCase.getUser(),
    onSuccess: (UserModel? data) {
      user = data;
    },
  );
  clearUser() => managerExecute(
    authUseCase.clearUser(),
    onSuccess: (data) {
      user = null;
      Routes.loginRoute.moveToCurrrentRouteAndRemoveAll;

      emit(LoadedState(data: null));
    },
  );

  void logOutDemo() {
    user = null;
    emit(ChangeState());
  }
}
