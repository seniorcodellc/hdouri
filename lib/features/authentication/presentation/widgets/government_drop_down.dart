import 'package:cherubini/config/errors/widgets/error_text.dart';
import 'package:cherubini/core/widgets/expansion_network_drop_down.dart';
import 'package:cherubini/features/authentication/data/model/response_model/governorate_response_model.dart';
import 'package:cherubini/features/authentication/presentation/managers/governorates_cubit.dart';

import '../../../../exports.dart';

class GovernmentDropdown extends StatelessWidget {
  final void Function(GovernorateModel government) onGovernmentSelected;
  const GovernmentDropdown({required this.onGovernmentSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GovernoratesCubit, CubitStates>(
          builder: (context, state) {
            return ExpansionNetworkDropDown<GovernorateModel>(
              items: context.read<GovernoratesCubit>().list,
              title: AppStrings.governmentHintAr,
              cubitStates: state,
            onSelected: ( item) =>onGovernmentSelected.call(item),
            );
          },
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) {
            return ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(Errors.GOVERNORATE_ERROR),
              text: getError[Errors.GOVERNORATE_ERROR],
            );
          },
        ),
      ],
    );
  }
}
