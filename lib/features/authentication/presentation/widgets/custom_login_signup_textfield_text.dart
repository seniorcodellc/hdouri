import '../../../../exports.dart';

class CustomTitleAndField extends StatelessWidget {
  final Widget child;
  const CustomTitleAndField({
    super.key,
    required this.text,
    required this.child,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: getRegularTextStyle(color: AppColors.primaryColor)),
        8.vs,
        child,
      ],
    );
  }
}
