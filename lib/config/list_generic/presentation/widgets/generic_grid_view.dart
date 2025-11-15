import 'package:cherubini/config/widgets/status_message.dart';
import '../../../../exports.dart';

class GenericGridListView<CubitType extends CubitListView<T>, T> extends StatelessWidget {
  final Widget Function(int index, T item, List<T> items) itemWidget;
  final Widget shimmerWidget;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;
  final Function(int index, T item, List<T> items)? onItemTapped;
  final double? Function(int length)? height;
  final double? Function(int lenght)? width;
  final ScrollPhysics? physics;
  final double? cacheExtent;
  final bool reverse;
  final Widget? emptyWidget;
  final bool shrinkWrap;
  final RefreshCallback? onRefrish;
  final ScrollController? scrollController;
  const GenericGridListView({
    required this.itemWidget,
    required this.shimmerWidget,
    required this.gridDelegate,
    this.padding,
    this.cacheExtent,
    this.physics,
    this.reverse = false,
    this.emptyWidget,
    this.height,
    this.width,
    this.scrollController,
    this.shrinkWrap = false,
    this.onItemTapped,
    super.key,   this.onRefrish,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitType, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return Center(
            child: StatusMessage(
              text: state.message,
              iconData: Icons.error,
              padding:  EdgeInsetsDirectional.only(bottom: 60.h),
            ),
          );
        }
        if (state is LoadedState<List<T>>) {
          if (state.data.isEmpty) {
            return emptyWidget ??
                Center(
                  child: StatusMessage(
                    text: AppStrings.empty.trans.trans,
                    iconData: Icons.access_time,
                    padding:EdgeInsetsDirectional.only(bottom: 60.h),
                  ),
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
            child: RefreshIndicator(onRefresh:onRefrish??_handleRefresh ,
              child: GridView.builder(
                gridDelegate: gridDelegate,
                padding: padding,
                reverse: reverse,
                shrinkWrap: shrinkWrap,
                cacheExtent: cacheExtent,
                controller: scrollController,
                physics: physics ?? BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state is LoadedState<List<T>>) {
                    return GestureDetector(
                      onTap: () {
                        onItemTapped?.call(index, state.data[index], state.data);
                      },
                      child: itemWidget.call(index, state.data[index], state.data),
                    );
                  } else if (state is LoadingMoreState) {
                    if (index < state.data.length) {
                      return GestureDetector(
                        onTap: () {
                          if (state is LoadedState<List<T>>) {
                            onItemTapped?.call(index, state.data[index], state.data);
                          }
                        },
                        child: itemWidget.call(index, state.data[index], state.data),
                      );
                    } else {
                      return shimmerWidget;
                    }
                  }
                  return shimmerWidget;
                },
                itemCount: getCount(state),
              ),
            ),
          ),
        );
      },
    );
  }
  Future<void> _handleRefresh() async {



    // await context.read<BottomNavOperationCubit>().goToHome();

    await Future.delayed(const Duration(seconds: 1));


  }
  int getCount(CubitStates state) {
    if (state is LoadedState) {
      return state.data.length;
    }
    if (state is LoadingMoreState) {
      return state.data.length + AppConstants.nShimmerItems;
    }
    return AppConstants.shortLengthShimmers;
  }
}
