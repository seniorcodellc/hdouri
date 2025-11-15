import 'package:dartz/dartz.dart';


import '../../../../exports.dart';

abstract class QararValLicenseRepo {
  Future<Either<Failure,ResponseModel>> getQararValLicense();
}