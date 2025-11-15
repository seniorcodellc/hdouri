import 'package:hdouri/config/list_generic/domain/use_cases/list_use_cases.dart';
import 'package:hdouri/features/authentication/domain/repositories/merchant_list_repo.dart';

class MerchantListUseCases extends ListUseCases{
  MerchantListRepo merchantListRepo;
  MerchantListUseCases({required this.merchantListRepo}):super(listRepo: merchantListRepo);

}