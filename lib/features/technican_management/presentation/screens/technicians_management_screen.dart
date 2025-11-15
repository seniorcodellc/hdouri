import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/exports.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/models/technician_response_model/technician_response_model.dart';
import '../manager/technician_cubit.dart';
import '../widgets/active_list.dart';
import '../widgets/tech_item.dart';
import '../widgets/management_toggle.dart';
import '../widgets/waiting_list.dart';

class TechniciansManagementScreen extends StatefulWidget {
  const TechniciansManagementScreen({super.key});

  @override
  State<TechniciansManagementScreen> createState() => _TechniciansManagementScreenState();
}

class _TechniciansManagementScreenState extends State<TechniciansManagementScreen> {
  bool selectedTab = true;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppbar(title: AppStrings.techniciansManagement.trans),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ManagementToggle(
                onTabSelected: (value) {
                context.read<TechnicianCubit>().filterTechnicians(status: value);
                },
                selectedTab: selectedTab,
              ),
            ),
          //  SliverToBoxAdapter(child: 16.hs),
            SliverFillRemaining(
              child: Padding(padding: getPadding( vertical: 16.h),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.easeInOut,
                child: GenericListView<TechnicianCubit, TechnicianModel>(
                  padding: getPadding(horizontal: 16.w),
                  itemWidget: (index, items, item) =>
                      TechItemWidget(item: item, ),
                  separatorWidget: 16.vs,
                  shimmerWidget: (index) => SizedBox.shrink(),
                )
              ),
              )
            ),
          ],
        ),
    );
  }
}
