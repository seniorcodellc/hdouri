import 'package:hdouri/config/list_generic/data/models/list_model.dart';
import 'package:hdouri/config/models/item_response_model.dart';
import 'package:hdouri/config/network/model/response_model.dart';

class GovernorateResponseModel extends  ListResponseModel<GovernorateModel> {
  GovernorateResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      GovernorateModel.fromJson;
}


class GovernorateModel {
  int? id;
  String? name;
  List<ItemModel>? region;

  GovernorateModel({this.id, this.name, this.region});

  factory GovernorateModel.fromJson(json) => GovernorateModel(
    id: json['id'],
    name: json['name'],
    region: json['region'] != null
        ? ((json['region'] as List<dynamic>).map(
            (e) => ItemModel.fromJson(e),
          )).toList()
        : null,
  );
}

