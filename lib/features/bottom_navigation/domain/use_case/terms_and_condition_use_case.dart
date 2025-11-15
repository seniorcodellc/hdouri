

import '../../../../exports.dart';
import '../repo/terms_and_condition_repo.dart';

class TermsAndConditionUseCase {
  final TermsAndConditionRepo termsAndConditionRepo;
  TermsAndConditionUseCase({required this.termsAndConditionRepo});
  Future<Either<Failure,ResponseModel>> getTermsAndCondition() => termsAndConditionRepo.getTermsAndCondition();
}