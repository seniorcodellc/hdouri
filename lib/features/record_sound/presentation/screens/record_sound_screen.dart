import '../../../../exports.dart';

class RecordSoundScreen extends StatelessWidget {
  const RecordSoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPngImage(image: AppAssets.voiceMic),
          40.vs,
          Text(
            AppStrings.readRecordVoiceInstruction,
            style: getMediumTextStyle(fontSize: 20),
          ),
          16.vs,
          Text(
            AppStrings.readRecordVoiceInstruction2,
            style: getMediumTextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
          32.vs,
          CustomSVGImage(asset: AppAssets.voiceCircle),
          16.vs,
          Text(
            AppStrings.pressButtonLong,
            style: getMediumTextStyle(fontSize: 20, color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}
