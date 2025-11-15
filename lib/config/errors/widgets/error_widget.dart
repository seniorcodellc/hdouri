import '../../../../exports.dart';
import 'error_text.dart';

class CubitErrorWidget extends StatelessWidget {
  final Errors errorType;
  final EdgeInsetsGeometry? margin;
  const CubitErrorWidget({required this.errorType, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ErrorCubit, CubitStates>(
      builder: (context, state) {
        return ErrorText(
          showError: context.read<ErrorCubit>().errors.contains(errorType),
          text: getError[errorType]!.trans,
        );
      },
    );
  }
}
