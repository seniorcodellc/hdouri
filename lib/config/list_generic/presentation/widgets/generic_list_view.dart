import 'package:hdouri/config/widgets/failed_widget.dart';
import 'package:hdouri/config/widgets/status_message.dart';

import '../../../../exports.dart';

class GenericListView<CubitType extends CubitListView<T>, T>
    extends StatelessWidget {
  final Widget Function(int index, List<T> items, T item) itemWidget;
  final Widget separatorWidget;
  final Widget Function(int index) shimmerWidget;
  final ScrollPhysics? physics;
  final double? cacheExtent;
  final double? errorWidgetSize;
  final bool reverse;
  final Widget? emptyWidget;
  final Function(int index, T item)? onItemTapped;
  final EdgeInsetsGeometry? padding;
  final IconData? emptyIcon;
  final String? emptyText;
  final int nShimmersCount;
  final bool shrinkWrap;
  final RefreshCallback? onRefresh;
  final ScrollController? scrollController;
  final bool fixedLengthOnce;
  final double? Function(int length)? height;
  final double? Function(int lenght)? width;
  final Axis? scrollDirection;
  final bool? primary;
  const GenericListView({
      this.onRefresh,
    required this.itemWidget,
    required this.separatorWidget,
    required this.shimmerWidget,
    this.onItemTapped,
    this.primary,
    this.scrollController,
    this.shrinkWrap = false,
    this.height,
    this.fixedLengthOnce = false,
    this.width,
    this.emptyWidget,
    this.reverse = false,
    this.cacheExtent,
    this.physics,
    this.padding,
    this.nShimmersCount = AppConstants.nShimmerItems,
    this.emptyIcon,
    this.emptyText,
    super.key,
    this.scrollDirection,
    this.errorWidgetSize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitType, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return FailedWidget(
            width: errorWidgetSize ?? 100,
            height: errorWidgetSize ?? 100,
          );
        }
        if (state is LoadedState<List<T>>) {
          if (state.data.isEmpty) {
            return SizedBox(
              width: width?.call(getCount(state)),
              height: height?.call(getCount(state)),
              child: emptyWidget ??
                  Center(
                      child: StatusMessage(
                        iconData: emptyIcon ?? Icons.access_time,
                        text: emptyText ?? AppStrings.empty.trans,
                        padding: EdgeInsetsDirectional.only(bottom: 60.h),
                      )),
            );
          }
        }
        return SizedBox(
          width: width?.call(getCount(state)),
          height: height?.call(getCount(state)),
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                double maxScroll = notification.metrics.maxScrollExtent;
                double userScrolled = notification.metrics.extentBefore;
                if ((userScrolled / maxScroll) >= 0.7) {
                  context.read<CubitType>().getMoreList();
                }
              }
              return true;
            },
            child: RefreshIndicator(onRefresh: onRefresh??_handleRefresh,
              child: ListView.separated(
                scrollDirection: scrollDirection ?? Axis.vertical,
                padding: padding,
                reverse: reverse,
                primary: primary,
                shrinkWrap: shrinkWrap,

                cacheExtent: cacheExtent,
                controller: scrollController,
                physics: physics ?? BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state is LoadedState<List<T>>) {
                    return GestureDetector(
                      onTap: () {
                        onItemTapped?.call(index, state.data[index]);
                      },
                      child:
                      itemWidget.call(index, state.data, state.data[index]),
                    );
                  } else if (state is LoadingMoreState) {
                    if (index < state.data.length) {
                      return GestureDetector(
                        onTap: () {
                          if (state is LoadedState<List<T>>) {
                            onItemTapped?.call(index, state.data[index]);
                          }
                        },
                        child:
                        itemWidget.call(index, state.data, state.data[index]),
                      );
                    } else {
                      return shimmerWidget.call(index);
                    }
                  }
                  return shimmerWidget.call(index);
                },
                separatorBuilder: (context, index) => separatorWidget,
                itemCount: fixedLengthOnce ? 1 : getCount(state),
              ),
            ),
          ),
        );
      },
    );
  }

  int getCount(CubitStates state) {
    if (state is LoadedState) {
      return state.data.length;
    }
    if (state is LoadingMoreState) {
      print(state.data.length);

      return state.data.length + AppConstants.nShimmerItems;
    }
    return nShimmersCount;
  }

  Future<void> _handleRefresh() async {


    // await context.read<BottomNavOperationCubit>().goToHome();

    await Future.delayed(const Duration(seconds: 1));


  }
}
