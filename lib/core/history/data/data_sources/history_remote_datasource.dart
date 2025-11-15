import 'package:hdouri/config/list_generic/data/data_sources/list_remote_datasource.dart';
import 'package:hdouri/config/network/constants/endpoinst.dart';
import 'package:hdouri/config/network/impl/network_requests.dart';
import 'package:hdouri/config/network/model/response_model.dart';
import 'package:hdouri/core/history/data/models/history_response_model.dart';

abstract class HistoryRemoteDataSource extends ListRemoteDataSource {}

class HistoryRemoteDataSourceImpl extends RequestsImpl implements HistoryRemoteDataSource {
  HistoryRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getList({num? id, query}) => postRequest(
    endPoint: EndPoints.history,
    data: query,
    getFromJsonFunction: HistoryResponseModel.fromJson,

  );
}
