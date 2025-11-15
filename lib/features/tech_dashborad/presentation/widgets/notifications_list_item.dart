import 'package:cherubini/core/widgets/custom_switch.dart';

import '../../../../exports.dart';

class NotificationsListItem extends StatefulWidget {
  const NotificationsListItem({super.key, required this.text});
  final String text;

  @override
  State<NotificationsListItem> createState() => _NotificationsListItemState();
}

class _NotificationsListItemState extends State<NotificationsListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CustomSVGImage(asset: AppAssets.bill),
          8.hs,
          Text(
            widget.text,
            style: getRegularTextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          SizedBox(width: 45, height: 24, child: CustomSwitch()),
        ],
      ),
    );
  }
}
