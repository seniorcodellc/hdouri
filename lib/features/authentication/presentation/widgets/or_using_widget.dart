import 'package:hdouri/core/widgets/h_line.dart';

import '../../../../exports.dart';

class OrUsingWidget extends StatelessWidget {
  const OrUsingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(vertical: 30.h,horizontal: 16.w),
        child: Row(
          children: [
            HLine(width: 130,),
            8.hs,
            Text(AppStrings.orUsing,style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.lightGray),),
            8.hs,
            HLine(width: 130,),
          ],
    ),
    );
  }
}
