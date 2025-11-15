import 'package:hdouri/config/network/model/response_model.dart';

class TechSignUpResponseModel extends ObjectResponseModel {
  TechSignUpResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      TechSignUpModelData.fromJson;
}

class TechSignUpModelData {
  String? id;

  TechSignUpModelData({this.id});

  factory TechSignUpModelData.fromJson(dynamic json) =>
      TechSignUpModelData(id: json['id']);
}
