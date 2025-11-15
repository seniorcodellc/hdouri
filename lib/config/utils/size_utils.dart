
// ///This method is used to get device viewport width.
import '../../exports.dart';

get width {
  return ScreenUtil().screenWidth;
}
//
// ///This method is used to get device viewport height.
get height {
  num statusBar = ScreenUtil().statusBarHeight;
  num bottomBar = ScreenUtil().bottomBarHeight;
  num screenHeight = ScreenUtil().screenHeight - statusBar - bottomBar;
  return screenHeight;
}


///This method is used to set padding responsively
EdgeInsetsDirectional getPadding({
  double? all,
  double? start,
  double? top,
  double? end,
  double? bottom,
  double? vertical,
  double? horizontal,
}) {
  return getMarginOrPadding(
      all: all, start: start, top: top, end: end, bottom: bottom, vertical: vertical, horizontal: horizontal);
}
//
///This method is used to set margin responsively
EdgeInsetsDirectional getMargin({
  double? all,
  double? start,
  double? top,
  double? end,
  double? bottom,
  double? vertical,
  double? horizontal,
}) {
  return getMarginOrPadding(
      all: all, start: start, top: top, end: end, bottom: bottom, vertical: vertical, horizontal: horizontal);
}

// ///This method is used to get padding or margin responsively
EdgeInsetsDirectional getMarginOrPadding({
  double? all,
  double? start,
  double? top,
  double? end,
  double? bottom,
  double? vertical,
  double? horizontal,
}) {
  if (all != null) {
    start = all;
    top = all;
    end = all;
    bottom = all;
  }
  if (vertical != null) {
    top = vertical;
    bottom = vertical;
  }
  if (horizontal != null) {
    start = horizontal;
    end = horizontal;
  }
  return EdgeInsetsDirectional.only(
    start:start!=null?start.w:0,

    top: top!=null?top.h:0,
    end:end!=null?end.w:0,
    bottom: bottom!=null?bottom.h:0,
  );
}
