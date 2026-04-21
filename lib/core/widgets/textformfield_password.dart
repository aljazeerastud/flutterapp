import 'package:flutter/material.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/app_icons.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle ?hintStyle;
  final InputBorder ? border;
  final InputBorder ? enabledBorder;
  final InputBorder ? focusedBorder;
  const TextFormFieldPassword({this.hintText, this.validator, required this.controller, this.contentPadding, super.key, this.hintStyle, this.border, this.enabledBorder, this.focusedBorder});

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: 1,
      minLines: 1,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !visiblePassword,
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.text,
      onTapOutside:  (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorStyle: TextStyles.textViewRegular14.copyWith(color: AppColors.error),
        hintStyle: widget.hintStyle?? TextStyles.textViewRegular14,
        border: widget.border,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        suffixIcon: IconButton(
          onPressed: () => setState(() => visiblePassword = !visiblePassword),
          highlightColor: AppColors.transparent,
          splashColor: AppColors.transparent,
          icon: AppIcons.icon(
            size: 18,
            icon: visiblePassword ? AppIcons.seenEye : AppIcons.unseenEye,
            color: visiblePassword ? AppColors.primaryColor : AppColors.greyText,
          )
        ), 
      ),
    );
  }
}