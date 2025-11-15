import 'package:hdouri/config/list_generic/domain/use_cases/list_use_cases.dart';
import 'package:hdouri/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:hdouri/features/authentication/domain/repositories/governorates_repo.dart';

class GovernoratesUseCases extends ListUseCases{
  GovernoratesRepo governoratesRepo;
  GovernoratesUseCases({required this.governoratesRepo}):super(listRepo: governoratesRepo);

}