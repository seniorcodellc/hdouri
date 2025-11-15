import 'package:cherubini/core/widgets/shimmer_widget.dart';
import 'package:cherubini/exports.dart';

class OperationDetailsItemShimmer extends StatelessWidget {
  const OperationDetailsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 517.h,
      child: Stack(
        children: [
          CustomShimmer.fromRectangle(
            width: width,
            height: 517.h,
            borderRadius: BorderRadius.circular(20.0.r),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 2.r, blurRadius: 6.r, offset: Offset(0, 2.h)),
              BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 0.r, blurRadius: 2.r, offset: Offset(0, 1.h)),
            ],
          ),
          Padding(
            padding: getPadding(horizontal: 16.h, vertical: 24.w),
            child: Column(
              children: [
                _buildOperationInfo,
                16.vs,
                CustomShimmer.fromRectangle(height: 1.h, width: width),
                24.vs,
                _buildNumberOfProducts,
                16.vs,
                _buildProductsList,
                _buildProduceGaranteeButton,
              ],
            ),
          ),
        ],
      ),
    );
  }

  get _buildProduceGaranteeButton =>
      CustomShimmer.fromRectangle(borderRadius: BorderRadius.circular(20.r), width: width, height: 48.h);
  get _buildProductsList => Expanded(
    child: Column(
      children: [
        ...List.generate(
          3,
          (index) => Stack(
            children: [
              CustomShimmer.fromRectangle(
                borderRadius: BorderRadius.circular(20.r),
                width: width,
                margin: getPadding(bottom: 16.h),
                height: 64.h,
              ),
              Padding(
                padding: getPadding(all: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer.fromRectangle(
                      width: 156.w,
                      margin: getPadding(bottom: 16.h),
                      height: 11.h,
                    ),

                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: CustomShimmer.fromRectangle(
                        width: 156.w,
                        margin: getPadding(bottom: 16.h),
                        height: 11.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  get _buildOperationInfo => Row(
    children: [
      CustomShimmer.fromRectangle(width: 56.w, height: 56.h, borderRadius: BorderRadius.circular(10.0.r)),
      8.hs,
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer.fromRectangle(width: 105.w, height: 11.h, borderRadius: BorderRadius.circular(10.0.r)),
                10.vs,
                Row(
                  children: [
                    CustomShimmer.fromRectangle(width: 12.w, height: 12.h, borderRadius: BorderRadius.circular(10.0.r)),
                    8.hs,
                    CustomShimmer.fromRectangle(width: 100.w, height: 11.h, borderRadius: BorderRadius.circular(10.0.r)),
                  ],
                ),
              ],
            ),
            Expanded(
              child: CustomShimmer.fromRectangle(width: 92.w, height: 27.h, borderRadius: BorderRadius.circular(20.r)),
            ),
          ],
        ),
      ),
    ],
  );
  get _buildNumberOfProducts => Row(
    children: [
      CustomShimmer.fromRectangle(height: 20.h, width: 18.w),
      16.hs,
      CustomShimmer.fromRectangle(height: 11.h, width: 77.w),
    ],
  );
}
