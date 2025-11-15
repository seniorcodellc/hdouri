class ReSendRequestModel {
  String phone;
  String countryCode;

  ReSendRequestModel({required this.phone,required this.countryCode, });

  Map<String, dynamic> toJson() => {
    "phone_number": phone,
    "country_code": countryCode,
  };
}