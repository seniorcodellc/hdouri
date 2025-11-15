import '../../exports.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  List<Widget>? actions;
  CustomAppbar({required this.title, this.actions, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: getBoldTextStyle(
          fontSize: 24.sp,
          color: AppColors.primaryColor,
        ),
      ),
      backgroundColor: AppColors.scaffold,
      automaticallyImplyLeading: false,
      leadingWidth: 56.w,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          pop();
        },
        child: Icon(Icons.arrow_back, color: AppColors.grayHint,size: 28,),
      ),
      actions: actions ?? [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(width, 70.h);
}
