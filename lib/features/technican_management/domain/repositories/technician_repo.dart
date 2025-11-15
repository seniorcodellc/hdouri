import 'package:hdouri/config/list_generic/domain/repositories/list_repo.dart';
import 'package:hdouri/exports.dart';

abstract class TechnicianRepo extends ListRepo {
  Future<Either<Failure,ResponseModel>> approve(num id);
  Future<Either<Failure,ResponseModel>> suspend(num id);
  Future<Either<Failure,ResponseModel>> reactive(num id);
}
