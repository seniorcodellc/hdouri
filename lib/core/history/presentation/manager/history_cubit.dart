import 'package:hdouri/config/list_generic/presentation/manager/cubit_list_view.dart';
import 'package:hdouri/core/history/data/models/history_response_model.dart';
import 'package:hdouri/core/history/domain/use_cases/history_use_cases.dart';

class HistoryCubit extends CubitListView<HistoryModel>{
  HistoryUseCases historyUseCases;
  HistoryCubit({required this.historyUseCases}):super(listUseCases: historyUseCases);
}