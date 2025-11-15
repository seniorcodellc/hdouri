import '../../../../exports.dart';
import '../../data/models/operations_log_model.dart';

class OperationsLogCardProdsList extends StatelessWidget {
  const OperationsLogCardProdsList({super.key, required this.model});
  final OperationsLogModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(model.prodNames.length, (index) {
        return Padding(
          padding: getPadding(vertical: 8.h),
          child: Container(
            width: 311.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: AppColors.mutedBlue,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: getPadding(horizontal: 16.w, top: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.prodNames.elementAt(index),
                    style: getRegularTextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.prodCodes.elementAt(index),
                      style: getRegularTextStyle(
                        color: AppColors.grayHint,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
