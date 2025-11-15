import 'package:badges/badges.dart' as badges;
//import 'package:cherubini/features/authentication/presentation/managers/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/widgets/custome_svg_image.dart';
import '../../exports.dart';

class CustomAppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarSection({
    Key? key,

    ///   this.loginText,
    /*  required this.svgUserProfileIcon,
        required this.svgDrawerIcon,*/
    this.isHome = false,
    this.appBarTitle,
  }) : super(key: key);
  final bool isHome;
  final String? appBarTitle;

  /*  final String? loginText;
  final String svgUserProfileIcon;
  final String svgDrawerIcon;*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: getPadding(top: 15.67.h + ScreenUtil().statusBarHeight, horizontal: 16.w),
      child: isHome.isTrue ? _buildHomeAppBar(context) : _buildAppBar,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(49.h);

  get _buildAppBar => Center(
    child: Text(appBarTitle.validate.tr(), style: getMediumTextStyle(fontSize: 20.sp)),
  );

  _buildHomeAppBar(BuildContext context) => Container();/*BlocBuilder<AuthCubit, CubitStates>(
    builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
   *//*       if (context.read<AuthCubit>().userModel.isNotNull)
            Row(
              children: [
                CustomNetworkImage.circular(
                  radius: 43.r,
                  imageUrl: context.read<AuthCubit>().userModel?.personalPhoto,
                  errorAsset: AppAssets.profileImage,
                ),
                Text(
                  "${AppStrings.welcome.tr()} ${context.read<AuthCubit>().userModel?.mobile.validate}",
                  style: getRegularTextStyle(fontSize: 14.sp),
                ),
                Image(fit: BoxFit.fill, image: AssetImage(AppAssets.welcome)),
              ],
            )
          else*//*
            GestureDetector(
              onTap: () {
                Routes.loginRoute.moveTo();
              },
              child: Text(
                AppStrings.logIn.trans,
                style: getMediumTextStyle(fontSize: 14.sp, color: AppColors.cyanBlue),
              ),
            ),
          Image(fit: BoxFit.fill, height: 49.h, width: 67.w, image: AssetImage(AppAssets.eiadtyLogo)),
        ],
      );
    },
  );*/

  /*
  _buildNotificationsBadge(BuildContext context) => BlocBuilder<UnReadNotificationsCubit, CubitStates>(
    builder: (context, state) {
      return GestureDetector(onTap: () {
        context.read<UnReadNotificationsCubit>().readNotifications();
        Routes.notificationRoute.moveTo();
      }, child: Builder(builder: (context) {
        if (state is LoadedState && state.data != 0)
          return badges.Badge(
            position: badges.BadgePosition.topStart(
                top: state.data.toString().length > 1 ? -15 : -12, start: state.data.toString().length > 1 ? -15 : -5),
            badgeAnimation: badges.BadgeAnimation.scale(
              animationDuration: Duration(seconds: 3),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeContent: Text(
              state.data.toString(),
              style: getSemiBoldTextStyle(color: AppColors.white),
            ),
            child: Icon(
              Icons.notifications_none,
              color: AppColors.white,
            ),
          );
        return Icon(
          Icons.notifications_none,
          color: AppColors.white,
        );
      } //CustomSVGImage(asset: AppAssets().notificationIcon),
      ));
    },
  );
*/
}

// scaffoldKey.currentState!.openDrawer();
