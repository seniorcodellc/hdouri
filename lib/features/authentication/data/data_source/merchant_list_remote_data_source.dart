import 'package:hdouri/exports.dart';
import 'package:hdouri/features/authentication/data/model/response_model/merchant_list_response_model.dart';
abstract class MerchantListRemoteDataSource extends ListRemoteDataSource{

}
class MerchantListRemoteDataSourceImpl extends RequestsImpl implements MerchantListRemoteDataSource{
  MerchantListRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getList({num? id, query})=>getRequest(endPoint: EndPoints.merchantList,
      getFromJsonFunction: MerchantListResponseModel.fromJson);

}