import 'package:hdouri/config/failures/failure.dart';
import 'package:hdouri/config/helpers/network_helper.dart';
import 'package:hdouri/config/network/model/response_model.dart';
import 'package:hdouri/core/history/data/data_sources/history_remote_datasource.dart';
import 'package:hdouri/core/history/domain/repositories/histroy_repo.dart';
import 'package:dartz/dartz.dart';

class HistoryRepoImpl extends HistoryRepo {
  HistoryRemoteDataSource historyRemoteDataSource;
  HistoryRepoImpl({required this.historyRemoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> getList({num? id, query}) =>
      executeImpl(() => historyRemoteDataSource.getList(query: {"startDate": "01-01-2025", "endDate": "12-31-2025"}));
}
