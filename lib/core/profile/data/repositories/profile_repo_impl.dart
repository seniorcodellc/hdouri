import 'package:hdouri/core/profile/domain/repositories/profile_repo.dart';
import 'package:hdouri/exports.dart';
import '../data_sources/profile_remote_data_source.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> getData({num? id, query}) =>executeImpl(() =>profileRemoteDataSource.getData() ,);



}

