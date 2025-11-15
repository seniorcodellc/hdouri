import '../../../../exports.dart';

abstract class ListRemoteDataSource {
  Future<ResponseModel> getList({num? id, dynamic query});
}

