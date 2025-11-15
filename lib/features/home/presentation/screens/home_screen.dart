import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/exports.dart';
import 'package:hdouri/features/home/presentation/widgets/home_header.dart';
import 'package:hdouri/features/home/presentation/widgets/home_last_log_out.dart';
import 'package:hdouri/features/home/presentation/widgets/home_performance_board_button.dart';
import 'package:hdouri/features/home/presentation/widgets/home_permissions_button.dart';
import 'package:hdouri/features/home/presentation/widgets/home_presence_button.dart';
import 'package:hdouri/features/home/presentation/widgets/home_specify_your_location_button.dart';
import 'package:hdouri/features/home/presentation/widgets/home_timer.dart';
import 'package:hdouri/features/home/presentation/widgets/search_location_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: getPadding(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  24.vs,
                  HomeHeader(),
                  44.vs,
                  HomeLastLogOut(),
                  24.vs,
                  SearchLocationButton(),
                  24.vs,
                  HomeTimer(),
                  36.vs,
                  HomeSpecifyYourLocationButton(),
                  24.vs,
                  HomePermissionsButton(),
                  24.vs,
                  HomePerformanceBoardButton(),
                  24.vs,
                  HomePresenceButton(),
                  55.vs,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
