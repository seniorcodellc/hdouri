import 'package:hdouri/config/list_generic/presentation/manager/cubit_list_view.dart';
import 'package:hdouri/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:hdouri/features/authentication/domain/usecase/governorates_use_cases.dart';

class GovernoratesCubit extends CubitListView<GovernorateModel>{
  GovernoratesUseCases governoratesUseCases;
  GovernoratesCubit({required this.governoratesUseCases}):super(listUseCases: governoratesUseCases);
}