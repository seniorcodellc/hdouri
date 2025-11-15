
import '../../exports.dart';

class CustomNetworkImage extends StatelessWidget {
  String? imageUrl;
  String? errorAsset;
  double? bordWidth;
  double? height;
  double? width;
  Color? borderColor;
  double? radius;
  bool? isCircle;
  EdgeInsetsGeometry? padding;
  Color? color;
  Widget? errorWidget;
  Color? backGroundColor;
  BoxFit fit;
  void Function()? onTap;

  CustomNetworkImage.circular(
      {required this.radius,
      this.borderColor = AppColors.white,
      required this.imageUrl,
      this.bordWidth,
      this.errorAsset,
        this.errorWidget,
      this.backGroundColor,

      this.fit = BoxFit.fill,
      super.key})
      : isCircle = true;

  CustomNetworkImage.rectangle(
      {this.height,
      this.width,
      required this.imageUrl,
      this.bordWidth,
      this.borderColor,
      this.errorAsset,
      this.radius,
      this.color,
        this.errorWidget,
      this.onTap,
      this.backGroundColor,
      this.fit = BoxFit.fill,
      this.padding,
      super.key})
      : isCircle = false;

  @override
  Widget build(BuildContext context) {
    return isCircle.isTrue ? buildCircularImage : buildRectangleImage;
  }

  get buildCircularImage => GestureDetector(onTap: onTap,
    child: Container(
          height: radius!,
          width: radius!,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backGroundColor,
            border: bordWidth.isNotNull
                ? Border.all(
                    width: bordWidth!,
                    color: borderColor!,
                  )
                : null,
          ),
          // radius: radius,
          child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
              ? CachedNetworkSVGImage(
                  imageUrl!,
                  fit: fit,
                  height: radius,
                  width: radius,
                  placeholder: placeHolder,
                )
              : imageUrl.validateNetworkAsset
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      width: radius,
                      height: radius,
                      fit: fit,
                      placeholder: (context, url) => placeHolder,
                      errorWidget: (context, url, error) => buildAsset(errorAsset),
                    )
                  : buildAsset(imageUrl),
        ),
  );

  get buildRectangleImage => GestureDetector(onTap: onTap,
    child: Container(
          height: height,
          width: width,
          padding: padding,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: radius.isNotNull ? BorderRadius.circular(radius!) : null,
            border: Border.all(width: bordWidth ?? 0, color: borderColor ?? AppColors.transparent),
          ),
          // radius: radius,
          child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
              ? CachedNetworkSVGImage(
                  imageUrl!,
                  color: color,
                  fit: BoxFit.fill,
                  placeholder: placeHolder,
                  errorWidget: buildErrorWidget,
                )
              : imageUrl.validateNetworkAsset
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      width: width,
                      fit: BoxFit.fill,
                      height: height,
                      placeholder: (context, url) => placeHolder,
                      errorWidget: (context, url, error) => buildErrorWidget,
                    )
                  : buildAsset(imageUrl),
        ),
  );

  Widget buildAsset(String? asset) {
    if (asset.isNotNullOrEmpty) {
      if (asset!.contains('assets')) {
        if (asset!.contains("svg")) {
          return SvgPicture.asset(
            asset,
            fit: fit,
          );
        } else {
          return Image.asset(
            asset,
            fit: fit,
          );
        }
      } else {
        File file = File(asset);
        if (file.existsSync()) {
          return Image.file(
            file,
            fit: BoxFit.cover,
          );
        } else {
          return buildErrorWidget;
        }
      }
    }
    return buildErrorWidget;
  }

  get buildErrorWidget {
    if(errorWidget.isNotNull){
      return errorWidget;
    }
    else if (errorAsset.isNotNull) {
      if (errorAsset.validateIsNetworkAsset) {
        if (errorAsset!.contains("svg")) {
          return CachedNetworkSVGImage(
            errorAsset!,
            fit: BoxFit.fill,
          );
        } else {
          return CachedNetworkImage(
            imageUrl: errorAsset!,
            fit: BoxFit.fill,
          );
        }
      } else {
        if (errorAsset!.contains("svg")) {
          return SvgPicture.asset(
            errorAsset!,
            height: radius,
            width: radius,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              color ?? AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          );
        } else {
          return Image.asset(
            errorAsset!,
            fit: BoxFit.fill,
          );
        }
      }
    } else {
      return CustomPngImage( image: AppAssets.logo);
    }
  }

  get placeHolder => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );
}
