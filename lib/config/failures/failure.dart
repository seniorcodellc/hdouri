
import '../../exports.dart';

class Failure {
  int code; // 200 or 400
  String message; // error or success
  dynamic data;
  Failure(this.code, this.message, {this.data});
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage().DEFAULT);
}
