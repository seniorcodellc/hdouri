import 'package:cherubini/features/tech_dashborad/presentation/widgets/tech_dashboard_body.dart';
import '../../../../exports.dart';
import '../../../../core/widgets/shared_dashboard_header.dart';

class TechDashboard extends StatelessWidget {
  const TechDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
               SharedDashboardHeader(onTap: () {Routes.settings.moveTo();},),
              Padding(
                padding: getPadding(top: 145.h, bottom: 30.h),
                child: const TechDashboardBody(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
