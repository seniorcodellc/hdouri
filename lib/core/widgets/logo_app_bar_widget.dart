import '../../exports.dart';

class LogoAppBarWidget extends StatelessWidget {
  const LogoAppBarWidget({super.key, required this.isPop, this.title});
  final bool isPop ;
  final String? title ;
/*
  get buildArrow => isPop ?  Expanded(
    child: Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
          onTap: (){
            pop();
          },
          child: SvgPicture.asset(AppAssets.miniArrowBack)
      ),
    ),
  ) : const SizedBox.shrink();
*/


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        children: [
          Spacer(),
          title.isNotNull? Text(
              title!,
            style: getBoldTextStyle(fontSize: 18, color: AppColors.black),
          ) : const SizedBox.shrink(),
         // buildArrow,
          isPop ?  const SizedBox.shrink() : const Spacer(),
        ],
      ),
    );
  }
}
