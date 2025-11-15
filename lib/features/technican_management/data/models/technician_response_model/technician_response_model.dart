import 'package:cherubini/exports.dart';

class TechnicianResponseModel extends ListResponseModel<TechnicianModel> {
  TechnicianResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      TechnicianModel.fromJson;
}

/// id : 16
/// name : "test2"
/// points : 0.0
/// status : 0

class TechnicianModel {
  TechnicianModel({this. id, this. name, this. points, this. status}) ;

  TechnicianModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    points = json['points'];
    status = json['status'];
  }
  num? id;
  String? name;
  num? points;
  num? status;
  TechnicianModel copyWith({num? id, String? name, num? points, num? status}) =>
      TechnicianModel(
        id: id ?? id,
        name: name ??name,
        points: points ?? points,
        status: status ?? status,
      );


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['points'] = points;
    map['status'] = status;
    return map;
  }
}
