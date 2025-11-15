
import '../../../../exports.dart';
import '../../domain/repositories/technician_repo.dart';
import '../data_sources/technician_remote_data_sources.dart';

class TechnicianRepoImpl extends TechnicianRepo {
  TechnicianRemoteDataSource technicianRemoteDataSources;
  TechnicianRepoImpl({required this.technicianRemoteDataSources});
  @override
  Future<Either<Failure, ResponseModel>> getList({num? id, query}) =>
      executeImpl(() => technicianRemoteDataSources.getList());

  @override
  Future<Either<Failure, ResponseModel>> approve(num id)=>executeImpl(() => technicianRemoteDataSources.approve(id),);

  @override
  Future<Either<Failure, ResponseModel>> reactive(num id) =>executeImpl(() => technicianRemoteDataSources.reactivate(id),);

  @override
  Future<Either<Failure, ResponseModel>> suspend(num id)=>executeImpl(() => technicianRemoteDataSources.suspend(id),);

}
