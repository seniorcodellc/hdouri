// ignore_for_file: must_be_immutable

import '../../exports.dart';

class CustomPngImage extends StatelessWidget {
  CustomPngImage({
    super.key,
    required this.image,
    this.alignment = Alignment.center,
    // this.width = 27.0,
    // this.height = 27.0,
  });

  final String image;

  // double width;
  // double height;
  Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return image.contains('http')
        ?Image(
      alignment: alignment,
      fit: BoxFit.fill,
      color: AppColors.transparent,
      image: NetworkImage(image),
    ) : Image(
            fit: BoxFit.fill,
            image: AssetImage(image),
          )
        ;
  }
}
