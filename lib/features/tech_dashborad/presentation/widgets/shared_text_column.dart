import '../../../../exports.dart';

class SharedTextColumn extends StatelessWidget {
  const SharedTextColumn({super.key, required this.text, required this.num});
  final String text;
  final String num;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: getRegularTextStyle(fontSize: 16, color: AppColors.white),
        ),
        Text(
          num,
          style: getSemiBoldTextStyle(fontSize: 24, color: AppColors.white),
        ),
      ],
    );
  }
}
