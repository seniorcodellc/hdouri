import 'package:hdouri/exports.dart';

class CustomScanButton extends StatelessWidget {
  const CustomScanButton({super.key, required this.text, required this.icon});
final String text ;
final String icon ;
  @override
  Widget build(BuildContext context) {
    return CustomButton(text: text, onPressed: (){Routes.successScanRoute.moveTo();},svgIconPath: icon,height: 58.h,);

  }
}
