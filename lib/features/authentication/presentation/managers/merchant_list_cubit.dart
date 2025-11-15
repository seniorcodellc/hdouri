import 'package:cherubini/config/list_generic/presentation/manager/cubit_list_view.dart';
import 'package:cherubini/features/authentication/data/model/response_model/merchant_list_response_model.dart';
import 'package:cherubini/features/authentication/domain/usecase/merchant_list_use_cases.dart';

class MerchantListCubit extends CubitListView<MerchantListModel>{
  MerchantListUseCases merchantListUseCases;
  MerchantListCubit({required this.merchantListUseCases}):super(listUseCases: merchantListUseCases);
}