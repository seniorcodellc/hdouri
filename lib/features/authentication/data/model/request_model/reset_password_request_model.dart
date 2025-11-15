class ResetPasswordRequestModel {
  final String phone;
  final String countryCode;
  final String code;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordRequestModel(
      {required this.countryCode,required this.phone, required this.code, required this.newPassword, required this.confirmPassword,});

  Map<String, dynamic> toJson() => {
        "phone_number": phone,
        "password_reset_code": code,
        "new_password": newPassword,
        "new_password_confirmation": confirmPassword,
        "country_code": countryCode,

      };
}
