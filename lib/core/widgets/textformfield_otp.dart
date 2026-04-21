import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class TextFormFieldOtp extends StatelessWidget {
  final TextEditingController controller;
  const TextFormFieldOtp({required this.controller, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            // FocusScope.of(context).focusInDirection(TraversalDirectionight);
          }
        },
        cursorColor: AppColors.primaryColor,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        style: TextStyles.textViewBold16.copyWith(color: AppColors.primaryColor),
        maxLines: null,
        minLines: null,
        expands: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          isDense: false,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: controller.text.isEmpty ? AppColors.primaryColor : AppColors.primaryColor, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(8)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: controller.text.isEmpty ? AppColors.primaryColor : AppColors.primaryColor, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(8)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(8)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(8)
          ),
        ),
      ),
    );
  }
}