import '../../exports.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.style,
    this.suffixIcon,
    this.radiusOfContainer,
    this.otherSuffixSvgIcon,
    this.controller,
    this.isPassword = false,
    this.maxLines,
    this.padding,
    this.maxLength,
    this.onChange,
    this.enabled,
    this.width,
    this.suffix,
    this.readOnly = false,
    this.height,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.onTap,
    this.suffixText,
    this.inputFormatters,
    this.backgroundColor,
    this.prefixIconConstraints,
    this.shadow,
    this.borderColor,
  });
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  bool obscureText;
  bool isPassword = false;
  TextStyle? style = getRegularTextStyle(
    fontSize: 12,
    color: AppColors.taupeGray,
  );
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final double? height;
  final String? suffixText;
  final bool readOnly;
  final double? width;
  final TextAlign textAlign;
  final Widget? otherSuffixSvgIcon;
  final double? radiusOfContainer;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final bool? enabled;
  final Widget? suffix;
  final Function(String)? onChange;
  void Function()? onTap;
  TextDirection? textDirection;
  BoxConstraints? prefixIconConstraints;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? shadow;
  List<TextInputFormatter>? inputFormatters;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  void initState() {
    if (widget.isPassword.isTrue) {
      widget.obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(widget.radiusOfContainer ?? 15.r),
        border: Border.all(color: widget.borderColor??AppColors.white),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(
              alpha: widget.shadow ?? 0.1,
            ),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        enabled: widget.enabled ?? true,
        validator: widget.validator,
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        onChanged: widget.onChange,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines ?? 1,
        mouseCursor: MouseCursor.uncontrolled,
        cursorColor: AppColors.primaryColor,
        autocorrect: true,
        textDirection: widget.textDirection,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: getRegularTextStyle(
          fontSize: 16.sp,
          color: AppColors.darkSlateGray,
        ),
        decoration: InputDecoration(
          contentPadding:
              widget.padding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          hintText: widget.hintText,
          hintStyle: widget.style,
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true,
          errorStyle: getSemiBoldTextStyle(
            color: AppColors.red,
            fontSize: 12.sp,
            height: 0.1.h,
          ),
          prefixIconConstraints: widget.prefixIconConstraints,
          prefixIcon: widget.prefixIcon,
          suffix: widget.suffix,
          suffixText: widget.suffixText,
          suffixIcon:
              widget.suffixIcon ??
              (widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      child: widget.obscureText
                          ? Icon(Icons.visibility_off, color: AppColors.liGray)
                          : Icon(
                              Icons.visibility_rounded,
                              color: AppColors.liGray,
                            ),
                    )
                  : null),
        ),
      ),
    );
  }
}
