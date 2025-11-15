
import 'package:hdouri/exports.dart';
import 'package:hdouri/features/authentication/data/model/response_model/governorate_response_model.dart';

abstract class GovernoratesRemoteDataSource extends ListRemoteDataSource{

}
class GovernoratesRemoteDatasourceImpl extends RequestsImpl implements GovernoratesRemoteDataSource{
  GovernoratesRemoteDatasourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getList({num? id, query})=>getRequest(endPoint: EndPoints.governorate,
      getFromJsonFunction: GovernorateResponseModel.fromJson);
  
}