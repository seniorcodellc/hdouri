import '../../../../exports.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPngImage(image: AppAssets.fingerprintBox),
          40.vs,
          Text(
            AppStrings.pleaseTouchFingerPrint,
            style: getMediumTextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
