
import '../../../../exports.dart';

/// status : true
/// message : "تم استرجاع البيانات بنجاح"
/// data : {"communicationTools":[{"id":1,"name":"مكالمة"},{"id":2,"name":"دردشة"},{"id":3,"name":"واتساب"}],"estateDetails":[{"id":1,"name":"غرفة نوم"},{"id":2,"name":"استقبال"},{"id":3,"name":"حمام"}],"extraDetails":[{"id":1,"name":"كراج","created_at":"2024-11-18T12:01:27.000000Z","updated_at":"2024-11-18T12:01:27.000000Z"},{"id":2,"name":"مكيف","created_at":"2024-11-20T20:41:09.000000Z","updated_at":"2024-11-20T20:41:09.000000Z"},{"id":3,"name":"مصعد","created_at":"2024-11-20T20:44:42.000000Z","updated_at":"2024-11-20T20:44:42.000000Z"},{"id":4,"name":"حديقة","created_at":"2024-11-20T20:45:07.000000Z","updated_at":"2024-11-20T20:45:07.000000Z"},{"id":5,"name":"صالة","created_at":"2024-11-23T02:14:49.000000Z","updated_at":"2024-11-23T02:14:49.000000Z"}]}

class ConfigResponseModel extends ResponseModel {
  ConfigResponseModel({
    super.status,
    super.message,
    super.data,
  });

  ConfigResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ConfigData.fromJson(json['data']) : null;
  }

  ConfigResponseModel copyWith({
    bool? status,
    String? message,
    ConfigData? data,
  }) =>
      ConfigResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// communicationTools : [{"id":1,"name":"مكالمة"},{"id":2,"name":"دردشة"},{"id":3,"name":"واتساب"}]
/// estateDetails : [{"id":1,"name":"غرفة نوم"},{"id":2,"name":"استقبال"},{"id":3,"name":"حمام"}]
/// extraDetails : [{"id":1,"name":"كراج","created_at":"2024-11-18T12:01:27.000000Z","updated_at":"2024-11-18T12:01:27.000000Z"},{"id":2,"name":"مكيف","created_at":"2024-11-20T20:41:09.000000Z","updated_at":"2024-11-20T20:41:09.000000Z"},{"id":3,"name":"مصعد","created_at":"2024-11-20T20:44:42.000000Z","updated_at":"2024-11-20T20:44:42.000000Z"},{"id":4,"name":"حديقة","created_at":"2024-11-20T20:45:07.000000Z","updated_at":"2024-11-20T20:45:07.000000Z"},{"id":5,"name":"صالة","created_at":"2024-11-23T02:14:49.000000Z","updated_at":"2024-11-23T02:14:49.000000Z"}]

class ConfigData {
  ConfigData(
      {this.communicationTools,
      this.estateDetails,
      this.extraDetails,
      this.estateTypes,
      this.adTypes,
      this.rentTypes,
      this.dateFilter,
      this.priceFilter,
      this.priceType,
      this.rentalBudget,
      this.paymentGateWays,
      this.roles});
  List<ItemModel>? communicationTools;
  List<ItemNumberModel>? estateDetails;
  List<ItemModel>? extraDetails;
  List<ItemModel>? estateTypes;
  List<ItemModel>? marketTypes;
  List<ItemModel>? dateFilter;
  List<ItemModel>? priceFilter;
  List<ItemModel>? adTypes;
  List<ItemModel>? rentTypes;
  List<ItemModel>? cities;
  List<ItemModel>? accommodationTypes;
  List<ItemModel>? roles;
  List<ItemModel>? paymentGateWays;
  List<ItemModel>? priceType;
  String? currency;
  List<ItemModel>? rentalBudget;
  ConfigData.fromJson(dynamic json) {
    currency = json['currency'];
    if (json['gateways'] != null) {
      paymentGateWays = <ItemModel>[];
      json['gateways'].forEach((v) {
        paymentGateWays?.add(ItemModel.fromJson(
          v,
        ));
      });
    }
    if (json['roles'] != null) {
      roles = <ItemModel>[];
      json['roles'].forEach((v) {
        roles?.add(ItemModel.fromJson(
          v,
        ));
      });
    }
    if (json['market_type'] != null) {
      marketTypes = <ItemModel>[];
      json['market_type'].forEach((v) {
        marketTypes?.add(ItemModel.fromJson(
          v,
        ));
      });
    }
    if (json['cities'] != null) {
      cities = <ItemModel>[];
      json['cities'].forEach((v) {
        cities?.add(ItemModel.fromJson(v));
      });
    }
    if (json['dateFillter'] != null) {
      dateFilter = <ItemModel>[];
      json['dateFillter'].forEach((v) {
        dateFilter?.add(ItemModel.fromJson(
          v,
        ));
      });
    }
    if (json['estateDetails'] != null) {
      estateDetails = <ItemNumberModel>[];
      json['estateDetails'].forEach((v) {
        estateDetails?.add(ItemNumberModel.fromJson(v));
      });
    }
    if (json['extraDetails'] != null) {
      extraDetails = <ItemModel>[];
      json['extraDetails'].forEach((v) {
        extraDetails?.add(ItemModel.fromJson(v));
      });
    }
    if (json['estateTypes'] != null) {
      estateTypes = <ItemModel>[];
      json['estateTypes'].forEach((v) {
        estateTypes?.add(ItemModel.fromJson(v));
      });
    }
    if (json['contract_type'] != null) {
      adTypes = <ItemModel>[];
      json['contract_type'].forEach((v) {
        adTypes?.add(ItemModel.fromJson(v));
      });
    }
    if (json['request_type'] != null) {
      rentTypes = <ItemModel>[];
      json['request_type'].forEach((v) {
        rentTypes?.add(ItemModel.fromJson(v));
      });
    }
    if (json['priceFillter'] != null) {
      priceFilter = <ItemModel>[];
      json['priceFillter'].forEach((v) {
        priceFilter?.add(ItemModel.fromJson(v));
      });
    }
    if (json['accommodation_type'] != null) {
      accommodationTypes = <ItemModel>[];
      json['accommodation_type'].forEach((v) {
        accommodationTypes?.add(ItemModel.fromJson(v));
      });
    }
    if (json['price_type'] != null) {
      priceType = <ItemModel>[];
      json['price_type'].forEach((v) {
        priceType?.add(ItemModel.fromJson(v));
      });
    }
    if (json['price_type'] != null) {
      priceType = <ItemModel>[];
      json['price_type'].forEach((v) {
        priceType?.add(ItemModel.fromJson(v));
      });
    }
    if (json['rentalBudget'] != null) {
      rentalBudget = <ItemModel>[];
      json['rentalBudget'].forEach((v) {
        rentalBudget?.add(ItemModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['gateways'] = paymentGateWays?.map((v) => v.toJson()).toList();
    data['roles'] = roles?.map((v) => v.toJson()).toList();
    data['market_type'] = marketTypes?.map((v) => v.toJson()).toList();
    data['cities'] = cities?.map((v) => v.toJson()).toList();
    data['dateFillter'] = dateFilter?.map((v) => v.toJson()).toList();
    data['estateDetails'] = estateDetails?.map((v) => v.toJson()).toList();
    data['extraDetails'] = extraDetails?.map((v) => v.toJson()).toList();
    data['estateTypes'] = estateTypes?.map((v) => v.toJson()).toList();
    data['contract_type'] = adTypes?.map((v) => v.toJson()).toList();
    data['request_type'] = rentTypes?.map((v) => v.toJson()).toList();
    data['priceFillter'] = priceFilter?.map((v) => v.toJson()).toList();
    data['accommodation_type'] = accommodationTypes?.map((v) => v.toJson()).toList();
    data['price_type'] = priceType?.map((v) => v.toJson()).toList();
    data['rentalBudget'] = rentalBudget?.map((v) => v.toJson()).toList();
    return data;
  }
}
