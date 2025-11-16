import 'package:hdouri/core/attendance_nav_button/presentation/screens/attendance_nav_button.dart';
import 'package:hdouri/exports.dart';
import 'package:hdouri/features/take_a_photo/presentation/widgets/take_a_photo_header.dart';

class TakeAPhotoScreen extends StatelessWidget {
  const TakeAPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TakeAPhotoHeader(),
        21.vs,
        CustomPngImage(image: AppAssets.takeAPhoto),
        40.vs,
        CustomSVGImage(asset: AppAssets.cameraCircle),
        96.vs,
      ],
    );
  }
}
