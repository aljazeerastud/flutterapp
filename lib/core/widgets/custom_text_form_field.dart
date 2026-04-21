import 'package:flutter/material.dart';

class CustomTextFormfield extends FormField<bool> {
  CustomTextFormfield({
    required TextField textField,
    Widget? validatorWidget,
    super.validator,
    super.autovalidateMode,
    super.enabled,
    super.key
  })
  :super(
    builder: (FormFieldState<bool> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textField,
          if(state.hasError) Builder(
            builder: (BuildContext context) => Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.25),
                borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(10), bottomEnd: Radius.circular(10))
              ),
            )
          )
        ],
      );
    }
  );
}

// state.errorText ?? "",