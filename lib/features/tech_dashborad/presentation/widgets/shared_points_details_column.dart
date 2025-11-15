import '../../../../exports.dart';

class SharedPointsDetailsColumn extends StatelessWidget {
  const SharedPointsDetailsColumn({
    super.key,
    required this.pointsType,
    required this.pointsNum,
  });
  final String pointsType;
  final String pointsNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 5.w),
      child: Column(
        children: [
          Text(
            pointsType,
            style: getRegularTextStyle(color: AppColors.accentColor),
          ),
          5.vs,
          Text(
            pointsNum,
            style: getRegularTextStyle(color: AppColors.subTitleColor),
          ),
        ],
      ),
    );
  }
}
