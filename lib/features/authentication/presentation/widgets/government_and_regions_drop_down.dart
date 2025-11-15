import 'package:cherubini/features/authentication/presentation/managers/cities_cubit.dart';
import 'package:cherubini/features/authentication/presentation/widgets/regions_drop_down.dart';
import 'package:cherubini/features/authentication/presentation/widgets/custom_login_signup_textfield_text.dart';
import 'package:cherubini/features/authentication/presentation/widgets/government_drop_down.dart';
import '../../../../exports.dart';
import '../../data/model/response_model/governorate_response_model.dart';

class GovernmentAndRegionsDropDown extends StatelessWidget {
  final Function(int? governmentId,int? cityId) onGovernmentAndCitySelected;
  GovernmentAndRegionsDropDown({required this.onGovernmentAndCitySelected,super.key});
  int? governorateId;
  int? regionId;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomTitleAndField(
            text: AppStrings.governmentAr,
            child: GovernmentDropdown(
              onGovernmentSelected: (government) {
                context.read<CitiesCubit>().setCities(government.region.validate);
                governorateId=government.id;
                regionId=null;
                onGovernmentAndCitySelected.call(governorateId,regionId);
              },
            ),
          ),
        ),

        15.hs,
        Expanded(
          child: CustomTitleAndField(
            text: AppStrings.region.trans,
            child: RegionsDropDown(onSelected: (city) {
              regionId=city.id;
              onGovernmentAndCitySelected.call(governorateId,regionId);
            }),
          ),
        ),
      ],
    );
  }
}
