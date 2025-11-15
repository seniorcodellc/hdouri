import '../../../../core/widgets/custom_button.dart';
import '../../../../exports.dart';

class ButtonWithArrowBack extends StatelessWidget {
  const ButtonWithArrowBack({
    super.key,
    required this.onTapArrowBack,
    required this.onTapNextPage,
  });
  final Function() onTapArrowBack;
  final Function() onTapNextPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200.w,
          child: CustomButton(text: AppStrings.next, onPressed: onTapNextPage, style: getBoldTextStyle(color: AppColors.white)),
        ),
        32.hs,
      ],
    );
  }
}
