import 'package:equatable/equatable.dart';
import 'package:cherubini/config/extensions/extensions.dart';

import '../list_generic/data/models/list_model.dart';

class ItemsResponseModel extends ListResponseModel<ItemModel> {
  ItemsResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction => ItemModel.fromJson;
}

class ItemsNumberResponseModel extends ListResponseModel<ItemNumberModel> {
  ItemsNumberResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction => ItemNumberModel.fromJson;
}

class ItemsImageResponseModel extends ListResponseModel<ItemImageModel> {
  ItemsImageResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction => ItemImageModel.fromJson;
}

class ItemModel extends Equatable {
 int? id;
   String? name;
  bool? isSelected = false;
  ItemModel({
    this.id,
    this.name,
    this.isSelected,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (id.isNotNull) {
      data['id'] = id;
    }

    return data;
  }

  get copyWith => ItemModel(id: id, name: name, isSelected: isSelected);

  @override
  List<Object?> get props => [id, name];
}

class ItemNumberModel extends ItemModel {
  int? number;
  ItemNumberModel({this.number, super.id, super.isSelected, super.name});
  factory ItemNumberModel.fromJson(Map json) => ItemNumberModel(
        name: json['name'],
        id: json['id'],
        isSelected: false,
        number: json['number'] ?? 0,
      );
  get copyWith => ItemNumberModel(id: id, name: name, isSelected: isSelected);
}

class ItemImageModel extends ItemModel {
  String? image;
  ItemImageModel({this.image, super.id, super.isSelected, super.name});
  factory ItemImageModel.fromJson(Map json) => ItemImageModel(
        name: json['name'],
        id: json['id'],
        isSelected: false,
        image: json['image'],
      );
  get copyWith => ItemImageModel(id: id, name: name, image: image, isSelected: isSelected);
}
