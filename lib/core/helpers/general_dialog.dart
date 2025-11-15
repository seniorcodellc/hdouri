import '../../exports.dart';

Future showCustomDialog({
  required BuildContext context,
  String? message,
  String? content,
  String? title,
  bool isAlert = true,
  Widget? widget,
  bool dismissible = false,
  double? space,
}) =>
    showDialog(
      barrierColor: AppColors.black.withOpacity(0.2),
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: Container(
              height: 184,
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        title!,
                        style: getSemiBoldTextStyle(
                          fontSize: 20,
                          color: AppColors.titleGray,
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      space.isNotNull
                          ? SizedBox(
                              height: space!.h,
                            )
                          : SizedBox(
                              height: 4.h,
                            ),
                      Text(
                        content!,
                        style: getMediumTextStyle(
                          fontSize: 16,
                          color: AppColors.titleGray,
                        ),
                      ),
                      widget!
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
