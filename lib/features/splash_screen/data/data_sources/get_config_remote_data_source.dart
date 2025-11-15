
import 'package:cherubini/exports.dart';

import '../models/config_response_model.dart';

abstract class GetConfigRemoteDataSource {
  Future<ResponseModel> getConfig();
}

class GetConfigRemoteDataSourceImpl extends GetConfigRemoteDataSource {
  final DioConsumer dioConsumer;
  GetConfigRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<ResponseModel> getConfig() =>
      remoteExecute(request: dioConsumer.getRequest(path: EndPoints.config), fromJsonFunction: ConfigResponseModel.fromJson);
}
