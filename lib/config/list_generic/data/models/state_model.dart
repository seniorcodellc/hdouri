

import 'package:cherubini/exports.dart';
class StateModel<T> {
/*
  int page;
*/
  int numberOfPages;
  List<T>? items;
  CubitStates? cubitStates;
  StateModel({this.items, this.numberOfPages = 1, this.cubitStates});
}
