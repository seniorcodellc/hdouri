import '../../../../exports.dart';

class GenericDataView<CubitType extends CubitDataView<T>, T> extends StatelessWidget {
  GenericDataView({this.shimmerWidget, this.errorWidget, this.buildLoadedWidget, super.key});
  GenericDataView.fromState({required this.buildLoadedWidgetWithState,super.key});

  Widget? shimmerWidget;
  Widget? errorWidget;
  Widget Function(T data)? buildLoadedWidget;
  Widget Function(CubitStates state)? buildLoadedWidgetWithState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitType, CubitStates>(
      builder: (context, state) {
        if (buildLoadedWidgetWithState.isNotNull) {
          return buildLoadedWidgetWithState!.call(state);
        } else {
          if (state is FailedState && errorWidget.isNotNull) {
            return errorWidget!;
          } else if (state is LoadedState<T> && buildLoadedWidget.isNotNull) {
            return buildLoadedWidget!.call(state.data);
          } else if (shimmerWidget.isNotNull) {
            return shimmerWidget!;
          }
          return SizedBox.shrink();
        }
      },
    );
  }
}
