import '../../../../exports.dart';

abstract class DataRemoteDataSource {
  Future<ResponseModel> getData({num? id, dynamic query});
}


