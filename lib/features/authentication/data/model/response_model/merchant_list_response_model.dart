import 'package:hdouri/config/list_generic/data/models/list_model.dart';

class MerchantListResponseModel extends  ListResponseModel<MerchantListModel> {
  MerchantListResponseModel.fromJson(super.json) : super.fromJson();

  @override
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      MerchantListModel.fromJson;
}


class MerchantListModel {
  int? id;
  String? name;
  MerchantListModel({this.id, this.name});

  factory MerchantListModel.fromJson(json) => MerchantListModel(
    id: json['id'],
    name: json['name'],
  );
}

