import 'package:cherubini/features/authentication/data/model/response_model/merchant_list_response_model.dart';
import 'package:cherubini/features/authentication/presentation/managers/merchant_list_cubit.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../core/widgets/expansion_network_drop_down.dart';
import '../../../../exports.dart';

class ChooseTraderDropDown extends StatelessWidget {
  final void Function(MerchantListModel merchantList) onMerchantSelected;
  const ChooseTraderDropDown({super.key, required this.onMerchantSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<MerchantListCubit, CubitStates>(
          builder: (context, state) {
            return ExpansionNetworkDropDown<MerchantListModel>(
              items: context.read<MerchantListCubit>().list,
              title: AppStrings.chooseMerchantAr,
              cubitStates: state,
              onSelected: ( item) =>onMerchantSelected.call(item),
            );
          },
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) {
            return ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(
                Errors.CHOOSE_MERCHANT_ERROR,
              ),
              text: getError[Errors.CHOOSE_MERCHANT_ERROR],
            );
          },
        ),
      ],
    );
  }
}

// Container(
// width: 343.w,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15.r),
// boxShadow: [
// BoxShadow(
// color: AppColors.shadowColor.withValues(alpha: 0.05),
// blurRadius: 4.r,
// spreadRadius: 0.r,
// offset: Offset(0, 1),
// ),
// BoxShadow(
// color: AppColors.shadowColor.withValues(alpha: 0.10),
// blurRadius: 4.r,
// spreadRadius: 0.r,
// offset: Offset(0, 1),
// ),
// ],
// ),
// child: DropdownButtonFormField(
// dropdownColor: AppColors.white,
// isExpanded: true,
// decoration: InputDecoration(
// fillColor: AppColors.white,
// filled: true,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15.r),
// borderSide: BorderSide.none,
// ),
// ),
// hint: Text("اختر التاجر المرتبط به ", style: getRegularTextStyle()),
// icon: CustomSVGImage(
// asset: AppAssets.arrow,
// fit: BoxFit.none,
// color: AppColors.subTitleColor,
// ),
// items: traders.map((trader) {
// return DropdownMenuItem(value: trader, child: Text(trader));
// }).toList(),
// onChanged: (value) {},
// ),
// ),