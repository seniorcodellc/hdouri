class LoginModel{
  String? email ;
  String?  password;
  LoginModel({this.password,this.email});
  toJson(){
    final map = <String,dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}