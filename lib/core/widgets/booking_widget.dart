import 'package:cherubini/core/widgets/custom_box.dart';

import '../../exports.dart';

class BookingWidget extends StatelessWidget {
 final bool isConsultation;
  const BookingWidget({this.isConsultation=true,super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBox(child: Padding(
      padding: getPadding(horizontal: 16.w,vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(isConsultation.isTrue?"لديك استشارة !":"لديك متابعة !", style: getRegularTextStyle(fontSize: 16.sp,color: AppColors.costColor)),
                    if(isConsultation.isFalse)Padding(
                      padding:getPadding(start: 6.w),
                      child: Text(
                        "1/3",style: getMediumTextStyle(fontSize: 14.sp,color: AppColors.silverGray),
                      ),
                    )
                  ],
                ),
                6.vs,
                Text("أد.محمود ابراهيم", style: getRegularTextStyle(fontSize: 16.sp,)),
                6.vs,
                Text(
                  "استشاري امراض القلب والصدر ",
                  style: getRegularTextStyle(fontSize: 14.sp, color: AppColors.doctorTitleColor),
                ),

              ],
            ),
          ),
          TextButton(child: Text(isConsultation.isTrue?"احجز الان":"احجز المتابعة",style: getRegularTextStyle(color: AppColors.textTimeColor,fontSize: 14.sp)),
          onPressed: () {
            Routes.reservationSteps.moveToWithArgs({"isConsultation": false});
          },
          )
        ],
      ),
    ));
  }
}
