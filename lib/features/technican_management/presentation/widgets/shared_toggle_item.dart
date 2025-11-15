import 'package:hdouri/exports.dart';
import 'package:flutter/material.dart';

class SharedToggleItem extends StatelessWidget {
  const SharedToggleItem({
    super.key,
    required this.text,
    required this.color,
    required this.style,
    required this.onTap,
  });
  final String text;
  final Color color;
  final TextStyle style;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 45.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(child: Text(text, style: style)),
      ),
    );
  }
}
