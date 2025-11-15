import 'package:cherubini/config/list_generic/data/data_sources/list_remote_datasource.dart';
import 'package:cherubini/config/network/constants/endpoinst.dart';
import 'package:cherubini/config/network/impl/network_requests.dart';
import 'package:cherubini/config/network/model/response_model.dart';
import 'package:cherubini/core/history/data/models/history_response_model.dart';

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
