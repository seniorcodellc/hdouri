import 'package:cherubini/config/failures/failure.dart';
import 'package:cherubini/config/helpers/network_helper.dart';
import 'package:cherubini/config/network/model/response_model.dart';
import 'package:cherubini/features/authentication/data/data_source/merchant_list_remote_data_source.dart';
import 'package:cherubini/features/authentication/domain/repositories/merchant_list_repo.dart';
import 'package:dartz/dartz.dart';

class MerchantListRepoImpl extends MerchantListRepo{
  MerchantListRemoteDataSource merchantListRemoteDataSource;
  MerchantListRepoImpl({required this.merchantListRemoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> getList({num? id, query})=>executeImpl(() => merchantListRemoteDataSource.getList());

}