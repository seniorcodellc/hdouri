import 'package:hdouri/core/widgets/custom_box.dart';

import '../../exports.dart';

class AddWidget extends StatelessWidget {
  final String title;
  final Function()?onTap;
  const AddWidget({required this.title,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomBox(
            padding: getPadding(vertical: 17.h,start: 8.w),
              child: Row(
                children: [
                  CustomSVGImage(asset: AppAssets.add),
                  6.hs,
                  Text(title,style: getMediumTextStyle(fontSize: 12.sp,color: AppColors.cyanBlue),),
                ],
              )),
        )
      ],
    );
  }
}
