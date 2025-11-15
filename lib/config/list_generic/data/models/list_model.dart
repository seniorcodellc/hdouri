import '../../../../exports.dart';

class ListModel<T> {
  int? numberOfPages;
  List<T>? list;
  ListModel({this.numberOfPages, this.list});
}

abstract class ListResponseModel<T> extends ResponseModel {
  ListResponseModel.fromJson(dynamic json) {
/*    data = ListModel(list: <T>[]);
    if (json is List) {
      (json as List).forEach((v) {
        data.list.add(getFromJsonFunction(v));
      });
    }
    status = true;*/
    print("eeeeeeeeeeeeeeeeee");
        status = json['success'];
    message = json['Message'];
    data = ListModel(list: <T>[]);
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.list?.add(getFromJsonFunction(v));
      });

    }
  }

  Function(Map<String, dynamic> data) get getFromJsonFunction;
}
