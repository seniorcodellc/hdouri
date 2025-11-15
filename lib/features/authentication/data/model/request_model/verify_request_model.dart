class VerifyRequestModel {
  String requestId;
  String verifyCode;
  //
  // String? deviceToken;

  VerifyRequestModel({ required this.verifyCode,required this.requestId});

  Map<String, dynamic> toJson() => {
    "OTP": verifyCode,
     "requestID": requestId
  };
}
