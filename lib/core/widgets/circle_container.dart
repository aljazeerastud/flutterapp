import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awa/core/constant/app_colors.dart';

class CircleContainer extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget? child;
  final BoxBorder? border;
  final Clip clipBehavior;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final bool noAlignment;
  final Function()? onTap;
  const CircleContainer({this.noAlignment = false, this.clipBehavior = Clip.none, this.onTap, this.child, this.alignment, this.margin, this.padding, this.color, this.border, this.size = 100, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: size,
        height: size,
        clipBehavior: clipBehavior,
        alignment: noAlignment?null:alignment??Alignment.center,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: border
        ),
        child: child,
      ),
    );
  }
}