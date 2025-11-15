import '../../../../exports.dart';

class ApplyForNextGiftRow extends StatelessWidget {
  const ApplyForNextGiftRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          AppStrings.applyForNextAcheiveAr,
          style: getRegularTextStyle(fontSize: 16, color: AppColors.white),
        ),
        Text(
          "10,000 / 9250",
          style: getRegularTextStyle(fontSize: 16, color: AppColors.white),
        ),
      ],
    );
  }
}
