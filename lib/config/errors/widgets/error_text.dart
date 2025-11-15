import '../../../../exports.dart';

class ErrorText extends StatelessWidget {
  final String? text;
  final bool showError;

  const ErrorText({required this.text, this.showError = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: 500.microseconds,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
        child: showError.isTrueGetWidgetOrAnotherWidget(
          Padding(
            padding:getPadding(start: 10.w,top: 5.h),
            child: Text(
              text!,
              textAlign: TextAlign.start,
              style: getRegularTextStyle(color: AppColors.red, fontSize: 16),
            ),
          ),
          const SizedBox.shrink(),
        ));
  }
}
