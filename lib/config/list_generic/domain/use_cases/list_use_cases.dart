
import '../../../../exports.dart';

class ListUseCases<T extends ResponseModel> {
  ListRepo<T> listRepo;
  ListUseCases({required this.listRepo});
  Future<Either<Failure, T>> getList({num? id, dynamic query}) => listRepo.getList(id: id, query: query);
}
