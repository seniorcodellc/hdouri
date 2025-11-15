import 'package:hdouri/features/authentication/presentation/widgets/register_accept_waiting.dart';

import '../../../../exports.dart';

class RegisterAcceptBody extends StatelessWidget {
  const RegisterAcceptBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 15.vs,
        CustomSVGImage(asset: AppAssets.clockCircle),
        32.vs,
        Text(
          AppStrings.waitingForAcceptRegisterTextAr,
          style: getRegularTextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        21.vs,
        RegisterAcceptWaiting(),
        21.vs,
      ],
    );
  }
}
