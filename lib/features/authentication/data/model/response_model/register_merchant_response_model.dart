import 'package:cherubini/config/network/model/response_model.dart';

class RegisterMerchantResponseModel extends ObjectResponseModel{
  RegisterMerchantResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction => MerchantRegisterModel.fromJson;

}
class MerchantRegisterModel {
  int? id;

  MerchantRegisterModel({this.id});

  factory MerchantRegisterModel.fromJson(dynamic json) => MerchantRegisterModel(id: json['id']);
}