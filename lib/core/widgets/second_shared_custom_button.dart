import '../../exports.dart';

class SecondSharedCustomButton extends StatelessWidget {
  const SecondSharedCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderColor: AppColors.mutedBlue,
      textColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      text: text,
      onPressed: onPressed,
    );
  }
}
