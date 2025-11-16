import 'package:hdouri/features/finger_print/presentation/screens/finger_print_screen.dart';
import 'package:hdouri/features/record_sound/presentation/screens/record_sound_screen.dart';
import 'package:hdouri/features/take_a_photo/presentation/screens/take_a_photo_screen.dart';
import 'package:hdouri/features/take_a_photo/presentation/widgets/take_a_photo_header.dart';

import '../../../../exports.dart';
import '../models/attendance_nav_button_model.dart';

class AttendanceNavButtonStatic {
  static List<AttendanceNavButtonModel> tabs = [
    AttendanceNavButtonModel(
      asset: AppAssets.camera,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      body: TakeAPhotoScreen(),
    ),
    AttendanceNavButtonModel(
      asset: AppAssets.fingerPrint,
      body: FingerPrintScreen(),
    ),
    AttendanceNavButtonModel(
      asset: AppAssets.voice,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        bottomLeft: Radius.circular(30.r),
      ),
      body: RecordSoundScreen(),
    ),
  ];
}
