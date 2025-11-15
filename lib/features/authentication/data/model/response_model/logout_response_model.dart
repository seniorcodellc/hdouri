

import '../../../../../exports.dart';

class LogoutResponseModel extends ResponseModel{
  LogoutResponseModel({
      super.status,
      super.message,
     });

  LogoutResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }


}