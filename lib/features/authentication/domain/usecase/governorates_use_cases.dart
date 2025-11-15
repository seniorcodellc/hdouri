import 'package:cherubini/config/list_generic/domain/use_cases/list_use_cases.dart';
import 'package:cherubini/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:cherubini/features/authentication/domain/repositories/governorates_repo.dart';

class GovernoratesUseCases extends ListUseCases{
  GovernoratesRepo governoratesRepo;
  GovernoratesUseCases({required this.governoratesRepo}):super(listRepo: governoratesRepo);

}