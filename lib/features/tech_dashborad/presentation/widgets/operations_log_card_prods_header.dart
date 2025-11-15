import '../../../../exports.dart';
import '../../data/models/operations_log_model.dart';

class OperationsLogCardProdsHeader extends StatelessWidget {
  const OperationsLogCardProdsHeader({super.key, required this.model});
  final OperationsLogModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSVGImage(asset: AppAssets.prods),
        16.hs,
        Text(
          "المنتجات (${model.prodNum})",
          style: getRegularTextStyle(
            fontSize: 16,
            color: AppColors.subTitleColor,
          ),
        ),
      ],
    );
  }
}
