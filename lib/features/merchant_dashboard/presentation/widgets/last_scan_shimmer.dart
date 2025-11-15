import 'package:cherubini/core/widgets/shimmer_widget.dart';
import 'package:cherubini/exports.dart';

class LastScanShimmer extends StatelessWidget {
  const LastScanShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomShimmer.fromRectangle(
          width: width,
          height: 100.h,
          borderRadius: BorderRadius.circular(20.0.r),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 2, blurRadius: 6)],
        ),

        Padding(
          padding: getPadding(horizontal: 16.w, vertical: 12.h),

          child: Row(
            children: [
              CustomShimmer.fromRectangle(
                width: 60.w,
                height: 60.h,
                borderRadius: BorderRadius.circular(16.0.r),

                padding: const EdgeInsets.all(12.0),
              ),12.hs, Expanded(child:            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomShimmer.fromRectangle(
                       height: 11.h,
                        width: 12.w,
                      ),
                      4.vs,      CustomShimmer.fromRectangle(
                        height: 26.h,
                        width: 66.w,
                      )
                    ],
                  ),
                  10.vs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      CustomShimmer.fromRectangle(
                        height: 14.h,
                        width: 112.w,
                      ),
                      CustomShimmer.fromRectangle(
                        height: 26.h,
                        width: 57.w,
                      ),
                    ],
                  )

                ],
              ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

/*
*
*
* */
