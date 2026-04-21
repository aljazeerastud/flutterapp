import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class TextFormFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final bool readOnly;
  final Color? cardColor;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final void Function()? onSuffixPressed;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder ;
  final InputBorder? border;
 final void Function(String)? onChanged;
  final bool? obscureText;
  final TextStyle ? hintStyle;
  final int? minLines;
  const TextFormFieldText({
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.minLines,
    this.onTap,
    this.contentPadding,
    this.maxLength,
    this.cardColor,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    required this.controller,
    super.key,
    this.onSuffixPressed,
    this.obscureText, this.hintStyle, this.enabledBorder, this.focusedBorder, this.border
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      maxLines: minLines != null ? null : 1,
      minLines: minLines ?? 1,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      onChanged:onChanged ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.text,
      maxLength: maxLength,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        enabledBorder: enabledBorder ,
        focusedBorder: focusedBorder,
        border: border,
        fillColor: cardColor??Theme.of(context).cardColor,
        hintText: hintText,
        hintStyle:hintStyle?? TextStyles.textViewRegular14,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        errorStyle: TextStyles.textViewRegular14.copyWith(color: AppColors.error),
        suffixIcon: suffixIcon == null ? null : Padding(padding: EdgeInsets.all(15), child: suffixIcon!),
        prefixIcon: prefixIcon == null ? null : Padding(padding: EdgeInsets.all(15), child: prefixIcon!),
      ),
    );
  }
}