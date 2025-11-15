import 'package:hdouri/features/authentication/presentation/managers/cities_cubit.dart';

import '../../../../config/errors/widgets/error_text.dart';
import '../../../../config/widgets/expansion_drop_down.dart';
import '../../../../exports.dart';

class RegionsDropDown extends StatelessWidget {
  final Function(ItemModel city) onSelected;
  const RegionsDropDown({required this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        BlocBuilder<CitiesCubit, CubitStates>(
          builder: (context, state) =>
              ExpansionDropDown(items: context.read<CitiesCubit>().cities, title: AppStrings.region.trans, onSelected: onSelected,),
        ),
        BlocBuilder<ErrorCubit, CubitStates>(
          builder: (context, state) {
            return ErrorText(
              showError: context.read<ErrorCubit>().errors.contains(Errors.CITY_ERROR),
              text: getError[Errors.CITY_ERROR],
            );
          },
        ),
      ],
    );
  }
}
