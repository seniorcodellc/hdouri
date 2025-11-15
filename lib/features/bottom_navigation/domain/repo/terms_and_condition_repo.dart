

import '../../../../exports.dart';

abstract class TermsAndConditionRepo {
  Future<Either<Failure,ResponseModel>> getTermsAndCondition();
}