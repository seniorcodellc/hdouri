

import '../../../../exports.dart';
import '../repo/about_qarar_repo.dart';

class AboutQararUseCase {
  final AboutQararRepo aboutQararRepo;
  AboutQararUseCase({required this.aboutQararRepo});
  Future<Either<Failure,ResponseModel>> getAboutQarar() => aboutQararRepo.getAboutQarar();
}