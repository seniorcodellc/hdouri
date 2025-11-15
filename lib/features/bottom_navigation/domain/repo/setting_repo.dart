import 'package:dartz/dartz.dart';


import '../../../../exports.dart';

abstract class SettingsRepo {
  Future<Either<Failure,ResponseModel>> getSettings();
}