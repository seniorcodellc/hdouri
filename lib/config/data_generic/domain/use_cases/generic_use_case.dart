
import 'package:hdouri/exports.dart';

import '../repositories/generic_repo.dart';

class GenericUseCases {
  final GenericRepo genericRepo;
  GenericUseCases({required this.genericRepo});
  Future<Either<Failure, ResponseModel>> getData({num? id, dynamic query}) => genericRepo.getData(id: id,query: query);

}
