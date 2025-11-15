import 'package:hdouri/features/authentication/data/model/response_model/governorate_response_model.dart';

import '../../exports.dart';

class ExpansionNetworkDropDown<T> extends StatefulWidget {
  final void Function(dynamic item) onSelected;
  final List<T> items;
  final String title;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final CubitStates cubitStates;

  const ExpansionNetworkDropDown({
    required this.onSelected,
    required this.items,
    required this.title,
    this.borderColor,
    this.titleStyle,
    required this.cubitStates,
    super.key,
  });

  @override
  State<ExpansionNetworkDropDown> createState() => _ExpansionNetworkDropDownState();
}

class _ExpansionNetworkDropDownState extends State<ExpansionNetworkDropDown> {
  int? selectedCountryId;
  String activeText = '';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
        child: ExpansionTile(
          maintainState: true,
          key: GlobalKey(),
          /* expansion */
          visualDensity: VisualDensity.compact,
          dense: true,
          initiallyExpanded: isExpanded,
          /*padding*/
          tilePadding: getPadding(start: 10, end: 10, vertical: 7),
          childrenPadding: getPadding(vertical: 10.h),
          /*colors*/
          onExpansionChanged: (value) {
            isExpanded = value;
            setState(() {});
          },
          iconColor: AppColors.grey,
          collapsedIconColor: AppColors.grey,
          backgroundColor: AppColors.transparent, //whole widget color while expanding
          trailing: getTrailingWidget,
          collapsedBackgroundColor: AppColors.transparent, //collapse color
          minTileHeight: 0, //make min height 0
          // childrenPadding: getPadding(horizontal: 100),
          /*shapes*/
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(19),
          ), //collapse shape
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: widget.borderColor ?? AppColors.transparent),
            borderRadius: BorderRadius.circular(6.h),
          ), //the whole widget shape while expanding
          title: Row(
            children: [
              Text(
                activeText.isNotEmpty ? activeText : widget.title,
                style: widget.titleStyle ?? getRegularTextStyle(color: AppColors.black.withOpacity(0.5), fontSize: 14),
              ),
            ],
          ),
          children: List.generate(widget.items.length, (index) => buildExpandedItem(index)),
        ),
      ),
    );
  }

  buildExpandedItem(int index) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      activeText = widget.items[index].name;
      widget.onSelected.call(widget.items[index]);
      isExpanded = false;
      setState(() {});
    },
    child: Container(
      padding: getPadding(vertical: 10, horizontal: 10),
      margin: getMargin(horizontal: 20, bottom: 15),
      decoration: BoxDecoration(
        color: activeText == widget.items[index].name ? AppColors.primaryColor : AppColors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.items[index].name,
            style: getRegularTextStyle(fontSize: 15, color: activeText == widget.items[index].name ? AppColors.white : null),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
  get getTrailingWidget {
    if (widget.cubitStates is LoadingState) {
      return _buildLoadingTrailingWidget;
    }
    if (widget.cubitStates is FailedState) {
      return const Icon(Icons.wifi_off_outlined);
    } else if (widget.cubitStates is LoadedState) {
      if (widget.items.isNotEmpty) {
        if (isExpanded.isTrue) {
          return const Icon(Icons.keyboard_arrow_up_outlined, color: AppColors.black);
        } else {
          return const Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.black);
        }
      } else {
        return SizedBox.shrink();
      }
    }
    return SizedBox.shrink();
  }

  get _buildLoadingTrailingWidget =>
      SizedBox(height: 8, width: 8, child: CircularProgressIndicator(color: AppColors.primaryColor));
}
