import 'package:flutter/material.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class CheckboxFormfield extends FormField<bool> {
  final EdgeInsetsGeometry? margin;
  CheckboxFormfield({
    double? size,
    Widget? child,
    BorderSide? side,
    Color? activeColor,
    OutlinedBorder? shape,
    this.margin,
    super.onSaved,
    super.validator,
    bool super.initialValue = true,
    bool autovalidate = false,
    super.key
  })
  :super(
    builder: (FormFieldState<bool> state) {
      return Padding(
        padding: margin?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size?? 30,
                  height: size?? 30,
                  child: Checkbox(
                    activeColor: activeColor ?? AppColors.primaryColor,
                    value: state.value,
                    onChanged: state.didChange,
                    shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    side: side ?? BorderSide(color: AppColors.primaryColor, width: 1),
                  ),
                ),
                if(child != null) Padding(
                  padding: EdgeInsetsDirectional.only(start: 3),
                  child: child,
                )
              ],
            ),
            if(state.hasError) Builder(
              builder: (BuildContext context) => Padding(
                padding: EdgeInsetsDirectional.only(top: 3, start: 10),
                child: Text(
                  state.errorText??'',
                  style: TextStyles.textViewRegular14.copyWith(color: AppColors.error),
                ),
              ),
            ),
          ],
        ),
      );
    }
  );
}