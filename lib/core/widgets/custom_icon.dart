import 'package:flutter/material.dart';
import 'package:cherubini/config/extensions/extensions.dart';
import 'package:cherubini/exports.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.padding,
    this.size,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final double? size;
  final Color? iconColor;
  final EdgeInsetsDirectional? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.all(10.r),
          child: Icon(
            icon,
            color: iconColor,
            size: size,
          ),
        ));
  }
}
