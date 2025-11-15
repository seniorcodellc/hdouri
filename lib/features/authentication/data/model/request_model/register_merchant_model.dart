class RegisterMerchantModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  int? governorateId;
  int? regionId;

    RegisterMerchantModel({
    this.phone,
    this.password,
    this.email,
    this.name,
    this.passwordConfirmation,
    this.governorateId,
    this.regionId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['RegionId'] = regionId;
    map['GovernorateId'] = governorateId;
    map['Phone'] = phone;
    map['Password'] = password;
    map['ConfirmPassword'] = passwordConfirmation;
    map['Email'] = email;
    map['Name'] = name;
    return map;
  }
}

