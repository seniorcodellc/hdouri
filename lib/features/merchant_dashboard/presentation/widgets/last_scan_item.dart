import 'package:hdouri/core/history/data/models/history_response_model.dart';
import 'package:hdouri/exports.dart';
import '../../data/models/scan_model.dart';
class LastScanItem extends StatelessWidget {
  const LastScanItem({super.key, required this.history});
  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding:getPadding(horizontal: 16.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: const Color(0xffE3F2FD),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              padding: const EdgeInsets.all(12.0),
              child: CustomSVGImage(asset: AppAssets.scanFilled),
            ),
            12.hs,
            Expanded(child:            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      history.id.toString(),
                      style: getRegularTextStyle(fontSize: 14.sp,color: AppColors.primaryColor),
                      // textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    4.vs,  Text(
                      '${history.points} نقطه',
                      //textDirection: TextDirection.rtl,
                      style: getRegularTextStyle(fontSize: 12.sp,color: AppColors.accentColor),
                    ),
                  ],
                ),
                10.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(DateTime.parse(history.date!)).toString(),
                      style: getRegularTextStyle(fontSize: 16.sp,color:AppColors.subTitleColor ),
                      //textDirection: TextDirection.rtl,
                    ),
                    Text(
                      '${history.detail!.length} منتجات',
                      textDirection: TextDirection.rtl,
                      style: getRegularTextStyle(fontSize: 12.sp,color: AppColors.subTitleColor),
                    ),
                  ],
                )

              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}