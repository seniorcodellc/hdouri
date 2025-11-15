

import '../../../../exports.dart';
import '../repo/qarar_val_license_repo.dart';

class QararValLicenseUseCase {
  final QararValLicenseRepo qararValLicenseRepo;
  QararValLicenseUseCase({required this.qararValLicenseRepo});
  Future<Either<Failure,ResponseModel>> getQararValLicense() => qararValLicenseRepo.getQararValLicense();
}