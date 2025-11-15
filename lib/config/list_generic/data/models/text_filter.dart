import 'filter_abstract.dart';

class TextFilter extends FilterAbstract {
  String? name;
  TextFilter({this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [name];

  @override
  toJson() => {'page': page, 'name': name};
}
