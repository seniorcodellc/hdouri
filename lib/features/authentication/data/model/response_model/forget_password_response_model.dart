
import '../../../../../exports.dart';

class ForgetPasswordResponseModel extends ResponseModel{
  ForgetPasswordResponseModel({
      super.status,
      super.message,
      super.data,});

  ForgetPasswordResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ForgetPasswordDataModel.fromJson(json['data']) : null;
  }

ForgetPasswordResponseModel copyWith({  String? code,
  ForgetPasswordDataModel? registerOtpDataModel,
}) => ForgetPasswordResponseModel(
  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class ForgetPasswordDataModel {
  ForgetPasswordDataModel({
      this.confirmationCode,});

  ForgetPasswordDataModel.fromJson(dynamic json) {
    confirmationCode = json['password_reset_code'];
  }
  num? confirmationCode;
ForgetPasswordDataModel copyWith({  num? confirmationCode,
}) => ForgetPasswordDataModel(  confirmationCode: confirmationCode ?? this.confirmationCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password_reset_code'] = confirmationCode;
    return map;
  }

}