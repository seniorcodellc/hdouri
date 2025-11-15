import 'package:hdouri/exports.dart';
class CustomInfoWidget extends StatelessWidget {
  const CustomInfoWidget({super.key, required this.asset, required this.info});
  final String asset;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:getPadding(horizontal: 16.0.w),
      child: Row(
        children: [
          CustomSVGImage(asset: asset),
          10.hs,
          Text(info,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.subTitleColor),)
        ],),
    );
  }
}
