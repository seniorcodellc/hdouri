import 'package:cherubini/core/widgets/custom_icon.dart';
import '../../exports.dart';

class CustomCircleImage extends StatelessWidget {
  final Color? circleColor;
  final String? asset;
  final IconData? icon;
  final bool isSVG;
  final Color? iconColor;
  final bool isIcon;
  final void Function()? onTap;
  final double radius;

  const CustomCircleImage({
    this.circleColor,
    this.icon,
    this.iconColor,
    this.radius = 32,
    this.isSVG = false,
    this.isIcon = false,
    this.asset,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          if (asset.validateNetworkAsset && asset!.contains("https")) {
            return SizedBox(
              width: radius,
              height: radius,
              child: CircleAvatar(
                radius: radius / 2,
                onBackgroundImageError: (exception, stackTrace) {
                  debugPrint(exception.toString());
                },
                backgroundImage: NetworkImage(asset!),
              ),
            );
          }
          return CircleAvatar(
            radius: radius / 2,
            backgroundColor: circleColor ?? AppColors.white,
            child: isSVG
                ? Align(
                alignment: Alignment.center,
                child: CustomSVGImage(asset: asset!))
                : isIcon
                    ? CustomIcon(
                        icon: icon!,
                        iconColor: iconColor ?? AppColors.primaryIconColor,
                        size: 15,
                      )
                    : Image.asset(
                        asset!,
                      ),
          );
        },
      ),
    );
  }
}
