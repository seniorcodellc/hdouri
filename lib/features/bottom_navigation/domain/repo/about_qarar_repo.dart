import 'package:dartz/dartz.dart';


import '../../../../exports.dart';

abstract class AboutQararRepo {
  Future<Either<Failure,ResponseModel>> getAboutQarar();
}