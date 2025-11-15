import 'package:hdouri/config/failures/failure.dart';
import 'package:hdouri/config/helpers/network_helper.dart';
import 'package:hdouri/config/network/model/response_model.dart';
import 'package:hdouri/features/authentication/data/data_source/governorates_remote_datasource.dart';
import 'package:hdouri/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:hdouri/features/authentication/domain/repositories/governorates_repo.dart';
import 'package:dartz/dartz.dart';

class GovernoratesRepoImpl extends GovernoratesRepo{
  GovernoratesRemoteDataSource governoratesRemoteDataSource;
  GovernoratesRepoImpl({required this.governoratesRemoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> getList({num? id, query})=>executeImpl(() => governoratesRemoteDataSource.getList(),);

}