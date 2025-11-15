
import '../../../../../exports.dart';

class ReSendOtpResponseModel extends ResponseModel{
  ReSendOtpResponseModel({
      super.code,
      super.status,
      super.message,
      super.data,});

  ReSendOtpResponseModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ReSendOtpDataModel.fromJson(json['data']) : null;
  }

ReSendOtpResponseModel copyWith({  String? code,
  bool? status,
  String? message,
  ReSendOtpDataModel? registerOtpDataModel,
}) => ReSendOtpResponseModel(  code: code ?? this.code,
  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class ReSendOtpDataModel {
  ReSendOtpDataModel({
      this.confirmationCode,});

  ReSendOtpDataModel.fromJson(dynamic json) {
    confirmationCode = json['confirmation_code'];
  }
  num? confirmationCode;
ReSendOtpDataModel copyWith({  num? confirmationCode,
}) => ReSendOtpDataModel(  confirmationCode: confirmationCode ?? this.confirmationCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['confirmation_code'] = confirmationCode;
    return map;
  }

}