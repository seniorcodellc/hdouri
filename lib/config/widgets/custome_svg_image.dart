
import '../../exports.dart';

class CustomSVGImage extends StatelessWidget {
  const CustomSVGImage(
      {super.key,
      required this.asset,
      this.matchTextDirection = true,
      this.color,
      this.fit = BoxFit.contain,

      this.height,
      this.width});

  final String asset;

  final Color? color;
  final BoxFit fit;
  final bool matchTextDirection;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    if (asset.contains("http")) {
      return SvgPicture.network(
        asset,
        fit: BoxFit.fill,
        matchTextDirection: matchTextDirection,
        color: color,
      );
    }
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        asset,
        color: color,
        fit: fit,
        matchTextDirection: matchTextDirection,
      ),
    );
  }
}
