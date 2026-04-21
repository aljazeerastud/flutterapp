import 'package:flutter/material.dart';
import 'package:awa/core/constant/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final double padding;
  const CustomLoading({super.key, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(color: AppColors.primaryColor, strokeWidth: 5),
        ),
      ),
    );
  }
}