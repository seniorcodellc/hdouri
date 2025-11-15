import 'dart:developer';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:hdouri/exports.dart';

class BuildPhoneNumberWidget extends StatelessWidget {
  const BuildPhoneNumberWidget(
      {super.key,
      required this.phoneNumberController,
      required this.onPhoneNumberChanged});
  final TextEditingController phoneNumberController;
  final Function({required String phoneNumber, required String countryCode})
      onPhoneNumberChanged;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      hintText: AppStrings.enterThePhoneNumber.trans,
      errorMessage: AppStrings.phoneRequired.trans,
      inputDecoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        errorStyle: getRegularTextStyle(fontSize: 16, color: AppColors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderColor2, width: 1.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderColor2, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.red, width: 1.4),
        ),
      ),
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.borderColor2, width: 1.4),
      ),
      onInputChanged: (PhoneNumber number) {
        onPhoneNumberChanged.call(
            phoneNumber: number.parseNumber().toString(),
            countryCode: number.dialCode.toString());
        // loginCountryId = number.isoCode!;
      },
      onInputValidated: (bool value) {
        log(value.toString());
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        useBottomSheetSafeArea: true,
        leadingPadding: 10,
        trailingSpace: false,
        setSelectorButtonAsPrefixIcon: true,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle:
          getRegularTextStyle(fontSize: 16, color: AppColors.primaryColor),
      initialValue: PhoneNumber(isoCode: "SA"),
      textFieldController: phoneNumberController,
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      onSaved: (PhoneNumber number) {
        log('On Saved: $number');
      },
    );
  }
}
