import '../../../../exports.dart';

class HomeLastLogOut extends StatelessWidget {
  const HomeLastLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSVGImage(asset: AppAssets.arrowUp),
        8.hs,
        Text(
          AppStrings.lastLogOut,
          style: getBoldTextStyle(fontSize: 16, color: AppColors.darkGray),
        ),
        48.hs,
        Column(
          children: [
            Text(
              AppStrings.day,
              style: getBoldTextStyle(fontSize: 16, color: AppColors.darkGray),
            ),
            Text(
              AppStrings.month,
              style: getBoldTextStyle(fontSize: 16, color: AppColors.darkGray),
            ),
          ],
        ),
        48.hs,
        Text(
          AppStrings.time,
          style: getBoldTextStyle(fontSize: 16, color: AppColors.darkGray),
        ),
      ],
    );
  }
}
