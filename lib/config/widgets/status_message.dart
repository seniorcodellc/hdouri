import '../../exports.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage({
    super.key,
    required this.text,
    required this.iconData,
    this.fontSize = 20,
    this.fontColor = Colors.blueGrey,
    this.iconColor = AppColors.primaryColor,
    this.padding,
    this.size = 100,
  });
  final String text;
  final double? size;
  final double? fontSize;
  final Color fontColor;
  final Color iconColor;
  final EdgeInsetsGeometry? padding;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    print("Error************* $text");
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 200,
            //   fit: BoxFit.fill,
          ),
          30.vs,
          Text(
            text,
            textAlign: TextAlign.center,
            style: getBoldTextStyle(fontSize: fontSize!, color: fontColor),
          )
        ],
      ),
    );
  }
}
