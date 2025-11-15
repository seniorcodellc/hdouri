import 'package:cherubini/config/list_generic/data/models/list_model.dart';

class HistoryResponseModel extends ListResponseModel<HistoryModel> {
  HistoryResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      HistoryModel.fromJson;
}

class HistoryModel {
  HistoryModel({this.id, this.date, this.points, this.detail});

  HistoryModel.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    points = json['points'];
    if (json['detail'] != null) {
      detail = [];
      json['detail'].forEach((v) {
        detail?.add(Detail.fromJson(v));
      });
    }
  }

  num? id;
  String? date;
  num? points;
  List<Detail>? detail;
  HistoryModel copyWith({
    num? id,
    String? date,
    num? points,
    List<Detail>? detail,
  }) => HistoryModel(
    id: id ?? this.id,
    date: date ?? this.date,
    points: points ?? this.points,
    detail: detail ?? this.detail,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['points'] = points;
    if (detail != null) {
      map['detail'] = detail?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// productName : "CMM45101700E"
/// serialNumber : "148253000522G"

class Detail {
  Detail({this.productName, this.serialNumber});

  Detail.fromJson(dynamic json) {
    productName = json['productName'];
    serialNumber = json['serialNumber'];
  }
  String? productName;
  String? serialNumber;
  Detail copyWith({String? productName, String? serialNumber}) => Detail(
    productName: productName ?? this.productName,
    serialNumber: serialNumber ?? this.serialNumber,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['serialNumber'] = serialNumber;
    return map;
  }
}
