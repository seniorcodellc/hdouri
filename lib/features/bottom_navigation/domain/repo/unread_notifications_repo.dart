import 'package:dartz/dartz.dart';


import '../../../../exports.dart';

abstract class UnReadNotificationsRepo {
  Future<Either<Failure, ResponseModel>> getUnReadNotifications();
  Future<Either<Failure, ResponseModel>> readNotifications();
}
