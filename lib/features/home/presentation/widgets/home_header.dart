import 'package:hdouri/exports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPngImage(image: AppAssets.profile),
        16.hs,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcome,
              style: getBoldTextStyle(fontSize: 16, color: AppColors.black),
            ),
            Text(
              AppStrings.userName,
              style: getBoldTextStyle(fontSize: 16, color: AppColors.black),
            ),
          ],
        ),
        150.hs,
        CustomSVGImage(
          asset: AppAssets.bill,
          fit: BoxFit.none,
          color: AppColors.darkGray,
        ),
      ],
    );
  }
}
