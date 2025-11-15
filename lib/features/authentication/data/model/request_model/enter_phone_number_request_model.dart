class EnterPhoneNumberRequestModel {
  String phoneNumber;
  String countryCode;
  int? id;

  EnterPhoneNumberRequestModel({
    required this.phoneNumber,
    required this.countryCode,
    this.id
  });
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['country_code'] = countryCode;
    map['user_id'] = id;
    return map;
  }
}