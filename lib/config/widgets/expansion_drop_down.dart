import '../../exports.dart';

class ExpansionDropDown extends StatefulWidget {
  final void Function(ItemModel item) onSelected;
  final List<ItemModel>? items;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final String? emptyText;
  final String? title;
  final bool showError;
  final Widget? leading;
  final Color? backgroundColor;
  String? activeText;

  ExpansionDropDown({
    required this.onSelected,
    required this.items,
    this.borderColor,
    this.emptyText,
    this.title,
    this.showError = false,
    this.leading,
    this.backgroundColor,
    this.titleStyle,
    this.activeText,
    super.key,
  });

  @override
  State<ExpansionDropDown> createState() => _ExpansionDropDownState();
}

class _ExpansionDropDownState extends State<ExpansionDropDown> {
  int? selectedCountryId;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor??AppColors.white,
            borderRadius: BorderRadius.circular(15.r),

          ),
          child: Center(
            child: ExpansionTile(
              maintainState: true,
              key: GlobalKey(),
              /* expansion */
              visualDensity: VisualDensity.compact,
              dense: true,
              initiallyExpanded: isExpanded,
              tilePadding: getPadding(start: 10, end: 10, vertical: 7),
              childrenPadding: getPadding(vertical: 10.h),
              onExpansionChanged: (value) {
                isExpanded = value;
                print(isExpanded);
                setState(() {});
              },
              iconColor: AppColors.grey,
              collapsedIconColor: AppColors.grey,
              backgroundColor:
                  AppColors.transparent, //whole widget color while expanding
              trailing: getTrailingWidget,
              leading: widget.leading,
              collapsedBackgroundColor: AppColors.transparent, //collapse color
              minTileHeight: 0, //make min height 0
              // childrenPadding: getPadding(horizontal: 100),
              /*shapes*/
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide(color: widget.borderColor ?? AppColors.white),
                borderRadius: BorderRadius.circular(19),
              ), //collapse shape
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: widget.borderColor ?? AppColors.transparent,
                ),
                borderRadius: BorderRadius.circular(6.h),
              ), //the whole widget shape while expanding
              title: Row(
                children: [
                  Text(
                    widget.activeText ?? widget.title.validate,
                    style:
                        widget.titleStyle ??
                        getRegularTextStyle(
                          color: AppColors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              children: List.generate(
                widget.items!.length,
                (index) => buildExpandedItem(index),
              ),
            ),
          ),
        ),
      ),
    );
    // return StatusMessage(
    //   text: widget.emptyText.validate,
    //   iconData: Icons.account_balance,
    // );
  }

  buildExpandedItem(int index) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      widget.items.deselectAll;
      widget.items![index].isSelected = true;
      widget.activeText = widget.items![index].name.validate;
      widget.onSelected.call(widget.items![index]);
      isExpanded = false;
      setState(() {});
    },
    child: Container(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      margin: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 15.h),
      decoration: BoxDecoration(
        color: widget.items![index].isSelected.orFalse
            ? AppColors.primaryColor
            : AppColors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.items![index].name.validate,
            style: getRegularTextStyle(
              fontSize: 15,
              color: widget.items![index].isSelected.isTrue
                  ? AppColors.white
                  : null,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
  get getTrailingWidget {
    if(widget.items.isNotNullOrEmpty){
      if (isExpanded.isTrue) {
        return const Icon(
          Icons.keyboard_arrow_up_outlined,
          color: AppColors.black,
        );
      } else {
        return const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.black,
        );
      }
    }else{
      return SizedBox.shrink();
    }

  }
}
