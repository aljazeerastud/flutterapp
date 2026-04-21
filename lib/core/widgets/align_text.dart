import 'package:flutter/material.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class AlignText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  const AlignText({this.textColor, this.style, this.alignment, this.padding, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding?? EdgeInsetsDirectional.only(start: 5, bottom: 5, top: 15),
      child: Align(
        alignment: alignment ?? AlignmentDirectional.centerStart,
        child: Text(text, style: style ??  TextStyles.textViewBold16.copyWith(color: textColor)),
      ),
    );
  }
}