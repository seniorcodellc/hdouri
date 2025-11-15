// ignore_for_file: must_be_immutable


import '../../exports.dart';

class CustomNetworkImage extends StatelessWidget {
  String? imageUrl;
  String? defaultAsset;
  double? bordWidth;
  double? height;
  double? width;
  Color? borderColor;
  double? radius;
  bool? isCircle;
  EdgeInsetsGeometry? padding;
  BoxFit defaultAssetFit;

  CustomNetworkImage.circular(
      {this.radius,
      this.borderColor = AppColors.white,
      required this.imageUrl,
      this.bordWidth,
      this.defaultAsset,
      this.defaultAssetFit = BoxFit.contain,
      super.key})
      : isCircle = true;

  CustomNetworkImage.rectangle(
      {this.height,
      this.width,
      this.radius,
      required this.imageUrl,
      this.bordWidth,
      this.defaultAsset,
      this.defaultAssetFit = BoxFit.contain,
      this.padding,
      super.key})
      : isCircle = false;

  @override
  Widget build(BuildContext context) {
    return isCircle.isTrue ? buildCircularImage : buildRectangleImage;
  }

  get buildCircularImage => Container(
        height: radius,
        width: radius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: bordWidth.isNotNull
              ? Border.all(
                  width: bordWidth!,
                  color: borderColor!,
                )
              : null,
        ),
        // radius: radius,
        child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
            ? SvgPicture.network(
                imageUrl!,
                fit: BoxFit.fill,
                height: radius,
                width: radius,
              )
            : imageUrl.validateNetworkAsset
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    width: radius,
                    height: radius,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        buildDefaultCircularAsset(defaultAsset),
                  )
                : buildDefaultCircularAsset(imageUrl),
      );

  get buildRectangleImage => Container(
        height: height,
        width: width,
        padding: padding,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius:
              radius.isNotNull ? BorderRadius.circular(radius!) : null,
          border: bordWidth.isNotNull
              ? Border.all(width: bordWidth!, color: AppColors.white)
              : null,
        ),
        // radius: radius,
        child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
            ? SvgPicture.network(
                imageUrl!,
                fit: BoxFit.fill,
              )
            : imageUrl.validateNetworkAsset
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    width: width,
                    fit: BoxFit.fill,
                    height: height,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        buildRectangleAsset(defaultAsset),
                  )
                : buildRectangleAsset(imageUrl),
      );

  buildDefaultCircularAsset(String? asset) {
    if (asset.isNotNull) {
      if (asset!.contains("svg")) {
        return SvgPicture.asset(
          asset,
          height: radius,
          width: radius,
          fit: defaultAssetFit,
        );
      } else if (asset.contains("png") ||
          asset.contains("jpg") ||
          asset.contains("jpeg")) {
        return Image.asset(
          asset,
          fit: defaultAssetFit,
        );
      }
      return Container(
        color: AppColors.primaryColor,
        alignment: Alignment.center,
        child: Text(
          asset.substring(0, 2),
          style: getBoldTextStyle(fontSize: 20.h, color: AppColors.white),
        ),
      );
    }
    return SizedBox(
      height: radius,
      width: radius,
      child: const Text("provide error asset"),
    );
  }

  buildRectangleAsset(String? asset) => Container(
        // color: AppColors.primaryColor,
        child: asset.isNotNull
            ? asset.validateNetworkAsset && asset!.contains("svg").isTrue
                ? SvgPicture.asset(
                    asset,
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  )
                : asset.validateNetworkAsset
                    ? CachedNetworkImage(imageUrl: asset!)
                    : Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            // color: AppColors.primaryColor,
                            image: DecorationImage(
                                image: AssetImage(asset!), fit: BoxFit.fill)),
                      )
            : Container(
                height: height,
                width: width,
                color: AppColors.primaryColor,
              ),
      );
}
