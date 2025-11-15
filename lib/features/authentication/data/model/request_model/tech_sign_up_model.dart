class TechSignUpModel {
  String? email;
  String? password;
  String? phone;
  String? name;
  String? confirmPassword;
  int? merchantId;
  TechSignUpModel({
    this.email,
    this.password,
    this.phone,
    this.name,
    this.confirmPassword,
    this.merchantId,
  });
  toJson() {
    final map = <String, dynamic>{};
    map["email"] = email;
    map["password"] = password;
    map["phone"] = phone;
    map["name"] = name;
    map["confirmPassword"] = confirmPassword;
    map["merchantid"] = merchantId;
    return map;
  }
}
