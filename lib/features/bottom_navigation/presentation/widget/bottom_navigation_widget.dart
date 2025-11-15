import 'package:cherubini/features/bottom_navigation/presentation/widget/bottom_nav_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/title_icon_model.dart';
import '../../../../exports.dart';
import '../../data/static/bottom_nav_bar_static.dart';
import '../managers/bottom_nav_operation_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});
  int selectedIndex = 0;

  void changeTab(int index) {
    /*  setState(() {
      selectedIndex = index;
    });
  }*/
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavOperationCubit, int>(
      builder: (context, state) => Container(
        height: 64.h,
        width: 375.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            BottomNavBarStatic.screens.length,
            (index) => BottomNavItem(
              bottomNavBarModel: BottomNavBarStatic.screens[index],
              isSelected: index == state,
              onTap: () {
                context.read<BottomNavOperationCubit>().changIndex(index);
              },
            ),
          ),
          /*   [
          bottomNavBarTab(0),
          bottomNavBarTab(1),
          45.hs,
          bottomNavBarTab(2),
          bottomNavBarTab(3),
        ],*/
        ),
      ),
    );
  }
}
