import 'package:hdouri/config/extensions/extensions.dart';

import '../../data/models/filter_abstract.dart';
import '../../data/models/state_model.dart';
import 'cubit_list_view.dart';

abstract class CubitFilterListView<Model, Filter extends FilterAbstract> extends CubitListView<Model> {
  CubitFilterListView({required super.listUseCases}) {
    initFilter();
  }
  late Filter parentFilter;
  initFilter() => parentFilter = getFilter;
  Filter get getFilter;
  List<Filter> queries = [];
  Map<int, StateModel<Model>> records = {};
  int? pop(Filter query) => queries.contains(query) ? queries.firstWhere((element) => element == query).key : null;
  num? id;
  @override
  Future<List<Model>?>? getList({num? id, FilterAbstract? query,Function(List<Model>list)? onSuccess}) {
    this.id = id;
    if (query.isNotNull) {
      parentFilter = query! as Filter;
    }
    return super.getList(id: id, query: query ?? parentFilter);
  }

  filterList(Filter query, {int? id}) {
    if (isFirstLoaded.isFalse) {
      getList(id: id, query: query);
    } else {
      int? key = pop(query);
      if (key.isNotNull) {
        saveFilter(parentFilter);
        parentFilter = query;
        getBackSavedFilter(key!);
      } else {
        saveFilter(parentFilter);
        startFilter(query);
      }
    }
  }

  saveFilter(Filter query) {
    int? key = pop(parentFilter);
    if (key.isNull) {
      int key = query.hashCode;
      query.key = key;
      queries.add(query);
      records[key] = StateModel(items: list, numberOfPages: numberOfPages!, cubitStates: state);
    } else {
      records[key!] = StateModel(items: list, numberOfPages: numberOfPages!, cubitStates: state);
    }
  }

  startFilter(Filter query) {
    parentFilter = query;
    getList(id: id, query: parentFilter);
  }

  void getBackSavedFilter(int key) {
    StateModel<Model> record = records[key]!;
    numberOfPages = record.numberOfPages;
    list = record.items!;
    emit(record.cubitStates!);
  }
}
