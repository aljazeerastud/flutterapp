import 'package:flutter/material.dart';
import 'package:awa/core/constant/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Function()? onTap;
  final  EdgeInsetsGeometry? margin;
  final  Widget child;
  const AppIconButton({super.key, this.margin, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: child,
      ),
    );
  }
}