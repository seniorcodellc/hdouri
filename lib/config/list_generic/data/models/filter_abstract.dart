import 'package:equatable/equatable.dart';

abstract class FilterAbstract extends Equatable {
  int page = 1;
  int? key;
  toJson(); // prototype
}
