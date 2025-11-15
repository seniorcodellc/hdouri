import 'package:cherubini/exports.dart';



Future<Either<Failure, ResponseModel>> executeCache(
    Future<ResponseModel> Function() local,
    ) async {
  ResponseModel response = await local.call();
  if (response.status.isTrue) {
    return Right(response);
  } else {
    return Left(Failure(int.parse(response.code!), response.message!));
  }
}
Future<Either<Failure, ResponseModel>> localExecute(
  Future<ResponseModel> local,
) async {
  ResponseModel response = await local;
  if (response.status.isTrue) {
    return Right(response);
  } else {
    return Left(Failure(int.parse(response.code!), response.message!));
  }
}
