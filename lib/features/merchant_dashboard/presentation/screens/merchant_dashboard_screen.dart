import 'package:hdouri/config/data_generic/presentation/widgets/generic_data_view.dart';
import 'package:hdouri/core/profile/data/models/profile_response_model.dart';
import 'package:hdouri/exports.dart';
import '../../../../core/profile/presentation/manager/profile_cubit.dart';
import '../../../../core/widgets/custom_background.dart';
import '../widgets/dashboard_points.dart';
import '../widgets/last_scan_list.dart';
import '../../../../core/widgets/shared_dashboard_header.dart';
import '../widgets/quick_action_widget.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.gradientColorStart,showNavBar: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: AlignmentGeometry.topCenter,
              children: [
                SharedDashboardHeader(
                  onTap: () {
                    Routes.merchantSettings.moveTo();
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    GenericDataView<ProfileCubit, ProfileModel>.fromState(
                      buildLoadedWidgetWithState: (state) {
                        if(state is LoadedState<ProfileModel>) {
                          return DashboardPoints(profile: state.data,);
                        }else{
                          return DashboardPoints();
                        }
                      },
                    ),

                    QuickActionWidget(),
                  ],
                ),
              ],
            ),
          ),
          SliverFillRemaining(child: LastScanList()),
        ],
      ),
    );
  }
}
