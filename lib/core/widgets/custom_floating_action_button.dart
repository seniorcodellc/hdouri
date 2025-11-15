import '../../exports.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Padding(
            padding: getPadding(all: 11),
            child: SizedBox(
              width: 52.w,
              height: 52.h,
              child: FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                elevation: 0,
                child: CustomSVGImage(
                  asset: AppAssets.scan,
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  Routes.scanRoute.moveTo();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
