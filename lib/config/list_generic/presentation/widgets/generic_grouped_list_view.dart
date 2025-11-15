import 'package:cherubini/config/widgets/status_message.dart';

import '../../../../exports.dart';

class GenericGroupedListView<CubitType extends CubitListView<T>, T>
    extends StatelessWidget {
  final Widget Function(int index, T item) itemWidget;
  final Widget separatorWidget;
  final Widget Function(int index) shimmerWidget;
  final ScrollPhysics? physics;
  final Function(T item)? onItemTapped;
  final EdgeInsetsGeometry? padding;
  final IconData? emptyIcon;
  final String? emptyText;
  final int nShimmersCount;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final double? cacheExtent;
  final bool reverse;
  final Widget? emptyWidget;
  final double? Function(int length)? height;
  final double? Function(int lenght)? width;
  final Widget Function(String title) sectionBuilder;
  final Widget Function() sectionShimmerWidget;
  const GenericGroupedListView({
    required this.itemWidget,
    required this.separatorWidget,
    required this.shimmerWidget,
    required this.sectionBuilder,
    required this.sectionShimmerWidget,
    this.onItemTapped,
    this.scrollController,
    this.physics,
    this.height,
    this.width,
    this.emptyWidget,
    this.reverse = false,
    this.cacheExtent,
    this.padding,
    this.shrinkWrap = false,
    this.nShimmersCount = AppConstants.nShimmerItems,
    this.emptyIcon,
    this.emptyText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitType, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return Center(
              child: StatusMessage(
                  text: state.message,
                  padding:EdgeInsetsDirectional.only(bottom: 60.h) ,
                  iconData: Icons.error));
        }
        if (state is LoadedState<Map<String, List<T>>>) {
          if (state.data.isEmpty) {
            return emptyWidget ??
                Center(
                    child: StatusMessage(
                      iconData: emptyIcon ?? Icons.access_time,
                      text: emptyText.validate,
                      padding:EdgeInsetsDirectional.only(bottom: 60.h),
                    ));
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
                  print("start pagination");
                }
              }
              return true;
            },
            child: ListView.separated(
              controller: scrollController,
              reverse: reverse,
              physics: physics,
              cacheExtent: cacheExtent,
              padding: padding,
              separatorBuilder: (context, index) => separatorWidget,
              itemBuilder: (BuildContext context, int section) {
                if (state is LoadedState<Map<String, List<T>>>) {
                  return Column(
                    children: [
                      sectionBuilder.call(state.data.keys.toList()[section]),
                      ...List.generate(
                        state.data.values.toList()[section].length,
                            (index) => GestureDetector(
                          onTap: () {},
                          child: itemWidget.call(index,
                              state.data.values.toList()[section][index]),
                        ),
                      )
                    ],
                  );
                } else if (state is LoadingMoreState<Map<String, List<T>>>) {
                  if (section < state.data.length) {
                    return Column(
                      children: [
                        sectionBuilder.call(state.data.keys.toList()[section]),
                        ...List.generate(
                          growable: false,
                          state.data.values.toList()[section].length,
                              (index) => GestureDetector(
                            onTap: () {
                              onItemTapped?.call(
                                  state.data.values.toList()[section][index]);
                            },
                            child: Column(
                              children: [
                                itemWidget.call(index,
                                    state.data.values.toList()[section][index]),
                                separatorWidget
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        sectionShimmerWidget.call(),
                        ...List.generate(
                          growable: false,
                          nShimmersCount,
                              (index) => Column(
                            children: [
                              shimmerWidget.call(index),
                              separatorWidget
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }
                return Column(
                  children: [
                    sectionShimmerWidget.call(),
                    ...List.generate(
                      growable: false,
                      nShimmersCount,
                          (index) => Column(
                        children: [shimmerWidget.call(index), separatorWidget],
                      ),
                    )
                  ],
                );
              },
              itemCount: getCount(state),
              //   sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
            ),
          ),
        );
      },
    );
  }

  int getCount(CubitStates state) {
    if (state is LoadedState<Map<String, List<T>>>) {
      return state.data.length;
    }
    if (state is LoadingMoreState) {
      return state.data.length + 1;
    }
    return 1;
  }
}
