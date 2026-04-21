import 'package:flutter/material.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.startSubText,
    this.centerSubText,
    this.endSubText,
    this.color,
    this.mainColor,
  });

  final String? startSubText;
  final String? centerSubText;
  final String? endSubText;
  final Color? color;
  final Color? mainColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: startSubText,
            style: TextStyles.textViewBold16.copyWith(color: mainColor?? AppColors.greyText),
          ),
          TextSpan(
            text: centerSubText,
            
            style: TextStyles.textViewBold16.copyWith(color: color?? AppColors.primaryColor),
          ),
          TextSpan(
            text: endSubText,
            style: TextStyles.textViewBold16.copyWith(color: mainColor?? AppColors.greyText),
          )
        ]
      ) 
    );
  }
}