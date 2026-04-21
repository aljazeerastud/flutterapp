import 'package:awa/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final DividerType type;
  final double length;
  final Color? color;
  final double margin;
  final double thickness;
  final double radius;
  final bool isHorizontal;
  const AppDivider({required this.type, required this.length, this.color,
    required this.isHorizontal,
    this.margin = 15, this.thickness = 1.5, this.radius = 5, super.key});
  
  // bool isHorizontal() => type == DividerTypeorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !isHorizontal ? thickness : length,
      height: isHorizontal ? thickness : length,
      margin: EdgeInsets.symmetric(horizontal: isHorizontal?0:margin , vertical: !isHorizontal?0:margin),
      decoration: BoxDecoration(
        color: color?? AppColors.greyText,
        borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}

enum DividerType {
  horizontal,
  vertical
}