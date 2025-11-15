
class UserEditModel  {
  String? name;
  String? phone;
  String? countryCode;
  String? email;
  int? id;
  String? address;
  String? photo;

  UserEditModel(
      {this.name,
      this.phone,
      this.photo,
      this.countryCode,
      this.id,
      this.email,
      this.address,
      });
  toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phone;
    map['country_code'] = countryCode;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['photo'] = photo;
    return map;
  }


}
