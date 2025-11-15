import 'package:hdouri/exports.dart';
import 'package:hdouri/config/extensions/extensions.dart';

import '../../core/utils/app_strings.dart';

enum Errors {
  PHONE_ERROR,
  NAME_ERROR,
  PASSWORD_ERROR,
  EMAIL_ERROR,
  OTP_ERROR,
  MATCHING_PASSWORD_ERROR,
  AGREE_TERMS_ERROR,
  AGREE_ID_ERROR,
  ID_IMAGE_ERROR,
  ID_ERROR,
  DATA_ERROR,
  GOVERNORATE_ERROR,
  CITY_ERROR,
  VERIFICATION_ERROR,
  CHOOSE_MERCHANT_ERROR,
}

Map<Errors, String> getError = {
  Errors.MATCHING_PASSWORD_ERROR: AppStrings.bothPasswordMustMatch.trans,
  Errors.OTP_ERROR: AppStrings.otpRequired.trans,
  Errors.PHONE_ERROR: AppStrings.phoneRequired.trans,
  Errors.PASSWORD_ERROR: AppStrings.passwordError.trans,
  Errors.EMAIL_ERROR: AppStrings.emailError.trans,
  Errors.AGREE_TERMS_ERROR: AppStrings.agreementRequired.trans,
  Errors.AGREE_ID_ERROR: AppStrings.agreementRequired.trans,
  Errors.GOVERNORATE_ERROR: AppStrings.governmentError.trans,
  Errors.CITY_ERROR: AppStrings.fieldIsRequired.trans,
  Errors.ID_IMAGE_ERROR: AppStrings.passportOrIdNumber.trans,
  Errors.ID_ERROR: AppStrings.fieldIsRequired.trans,
  Errors.DATA_ERROR: AppStrings.didNotChangeField.trans,
  Errors.NAME_ERROR: AppStrings.nameError.trans,
  Errors.VERIFICATION_ERROR: AppStrings.fieldIsRequired.trans,
  Errors.CHOOSE_MERCHANT_ERROR: AppStrings.fieldIsRequired.trans,
};

class ErrorCubit extends Cubit<CubitStates> {
  ErrorCubit() : super(InitialState());
  List<Errors> errors = [];
  addValidatorError(Errors error) {
    if (errors.contains(error).isFalse) {
      print("added error $error");
      errors.add(error);
      emit(ChangeState());
    }
  }

  removeError(Errors error) {
    if (errors.contains(error).isTrue) {
      print("error removed");
      errors.remove(error);

      emit(ChangeState());
    }
  }

  get clearErrors {
    errors.clear();
    emit(ChangeState());
  }
}
