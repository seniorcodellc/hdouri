import 'package:hdouri/config/list_generic/domain/use_cases/list_use_cases.dart';
import 'package:hdouri/core/history/domain/repositories/histroy_repo.dart';

class HistoryUseCases extends ListUseCases {
  HistoryRepo historyRepo;
  HistoryUseCases({required this.historyRepo}) : super(listRepo: historyRepo);
}
