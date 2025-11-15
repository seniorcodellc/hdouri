

import '../../../../exports.dart';

abstract class GenericRepo {
  Future<Either<Failure, ResponseModel>> getData({num? id, dynamic query});
}
