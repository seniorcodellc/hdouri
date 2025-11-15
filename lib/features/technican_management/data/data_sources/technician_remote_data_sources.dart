import 'package:cherubini/exports.dart';

import '../models/technician_response_model/technician_response_model.dart';

abstract class TechnicianRemoteDataSource extends ListRemoteDataSource {
  Future<ResponseModel> approve(num? id);
  Future<ResponseModel> suspend(num? id);
  Future<ResponseModel> reactivate(num? id);
}

class TechnicianRemoteDataSourceImpl extends RequestsImpl
    implements TechnicianRemoteDataSource {
  TechnicianRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getList({num? id, query}) => getRequest(
    endPoint: EndPoints.technicianList,
    getFromJsonFunction: TechnicianResponseModel.fromJson,
  );

  @override
  Future<ResponseModel> approve(num? id) => getRequest(
    endPoint: EndPoints.approved,
    query: {
      "technicianId":id
    },
    getFromJsonFunction: ResponseModel.fromJson,
  );

  @override
  Future<ResponseModel> suspend(num? id) => getRequest(
    endPoint: EndPoints.suspend,
    query: {
      "technicianId":id
    },
    getFromJsonFunction: ResponseModel.fromJson,
  );

  @override
  Future<ResponseModel> reactivate(num? id) => getRequest(
    endPoint: EndPoints.unSuspend,
    query: {
      "technicianId":id
    },
    getFromJsonFunction: ResponseModel.fromJson,
  );
}
