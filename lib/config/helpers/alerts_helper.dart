import 'dart:async';

import '../constants/localization_constants.dart';
import '../../exports.dart';
import '../widgets/custom_dialog.dart';

showSnackBar({required String message, required AlertTypes alertType, Duration? duration}) {
  Color backgroundColor = AppColors.white;
  if (alertType == AlertTypes.success) {
    backgroundColor = AppColors.green;
  } else if (alertType == AlertTypes.error) {
    backgroundColor = AppColors.red;
  } else if (alertType == AlertTypes.loading) {
    backgroundColor = AppColors.brown;
  }
  SnackBar snackBar = SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            message,
            style: getMediumTextStyle(color: AppColors.white, fontSize: 14),
          ),
        ),
        if (alertType == AlertTypes.loading)
          SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: AppColors.white))
      ],
    ),
    backgroundColor: backgroundColor,
    duration: duration ?? const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(getContext).showSnackBar(snackBar);
}

dismissSnackBar() {
  ScaffoldMessenger.of(getContext).hideCurrentSnackBar();
}

Future<T?> showCustomDialog<T>({
  String? message,
  Widget? child,
  bool isAlert = true,
  AlertTypes dialogType = AlertTypes.loading,
  bool dismissible = false,
  ShapeBorder? shape,
  EdgeInsetsGeometry? contentPadding,
  EdgeInsets? insetPadding
}) =>
    showDialog<T>(
      context: getContext,

      barrierDismissible: dismissible,
      builder: (context) {
        return isAlert
            ? AlertDialog(
          insetPadding: insetPadding,
                contentPadding: contentPadding,
                content: child,
          shape: shape,
              )
            : CustomDialog(
                message: message,
                dialogType: dialogType,
              );
      },
    );
Future showCustomDialogWithTimer({
  String? message,
  bool dismissible = true,
  AlertTypes dialogType = AlertTypes.loading,
  DialogTimingTypes dialogTimingType = DialogTimingTypes.long,
  void Function()? onTimeOut,
}) async {
  if (_isThereCurrentDialogShowing(getContext).isTrue) {
    pop();
  }
  showCustomDialog(isAlert: false, message: message, dialogType: dialogType, dismissible: dismissible);
  Timer(
    Duration(
      milliseconds:
          dialogTimingType == DialogTimingTypes.long ? AppConstants.dialogLongDuration : AppConstants.dialogShortDuration,
    ),
    () {
      pop();
      if (onTimeOut.isNotNull) {
        onTimeOut!();
      }
    },
  );
}

/* check whether Alert Dialog is open */
bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
/*hide keypad if it is shown*/
requestFocus(FocusNode focusNode) => FocusScope.of(getContext).requestFocus(focusNode);
showDateTimeDialog({DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) => showDatePicker(
      context: getContext,
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          dialogBackgroundColor: AppColors.white,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor, //dialog header background color
            onPrimary: AppColors.white, //selected text color and border
          ),
        ),
        child: child!,
      ),
      locale:
          // getBlocData<LanguageCubit>().isEn
          //     ? AppConstants.enLocale
          //     :
          AppLocalizationsConstants().arLocale,
      initialDate: initialDate.isNotNull ? initialDate! : DateTime.now(),
      firstDate: firstDate.isNotNull ? firstDate! : DateTime.now(),
      lastDate: lastDate.isNotNull ? lastDate! : DateTime(DateTime.now().year + AppConstants.maxYears),
    );

/// show child widget in dialog
Future<T?> showInDialog<T>({
  String? title,
  Widget? child,
  Widget? Function(BuildContext)? builder,
  ShapeBorder? shape,
  TextStyle? titleTextStyle,
  EdgeInsetsGeometry? contentPadding,
  //bool scrollable = false,
  EdgeInsetsGeometry? titlePadding,
  Color? backgroundColor,
  DialogAnimation dialogAnimation = DialogAnimation.DEFAULT,
  double? elevation,
  Color? barrierColor,
  //EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  List<Widget>? actions,
  bool barrierDismissible = true,
  bool hideSoftKeyboard = true,
  Duration? transitionDuration,
  Curve curve = Curves.easeInBack,
}) async {
  if (hideSoftKeyboard) hideKeyboard;

  return await showGeneralDialog<T>(
    context: getContext,
    barrierColor: barrierColor ?? Colors.black54,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    barrierLabel: '',
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration ?? 400.milliseconds,
    transitionBuilder: (_, animation, secondaryAnimation, c) {
      return dialogAnimatedWrapperWidget(
        animation: animation,
        dialogAnimation: dialogAnimation,
        curve: curve,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          content: builder != null ? builder.call(getContext) : child,
          shape: shape, titlePadding: titlePadding,
          title: Text(title!),
          titleTextStyle: titleTextStyle,
          contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          //scrollable: scrollable,
          backgroundColor: backgroundColor,
          elevation: elevation ?? AppConstants.defaultElevation,
          //insetPadding: insetPadding,
          actions: actions,
          icon: GestureDetector(
            onTap: pop,
            child: Align(alignment: AlignmentDirectional.centerStart, child: Icon(Icons.close)),
          ),
        ),
      );
    },
  );
}
