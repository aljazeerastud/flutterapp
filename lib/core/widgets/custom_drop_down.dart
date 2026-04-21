import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';


class AppDropDownMenu extends StatelessWidget {
  final String hint;
  final String title;
  final Function(Object?) onChanged;
  final double width;
  final double dropDownWidth;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final double? height;
  final double? radius;
  final TextStyle? hintStyle;
  final List<Object> items;
  final Color? backgroundColor;
  const AppDropDownMenu({
    super.key,
    required this.hint,
    required this.onChanged,
    this.width = 100,
    this.title = "",
    this.dropDownWidth = 200,
    this.titleStyle,
    this.height,
    this.borderColor,
    this.radius,
    this.backgroundColor,
    this.hintStyle,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
        Text(title, style: titleStyle ?? TextStyles.textViewBold16.copyWith(color: AppColors.text)),
        
        if (title.isNotEmpty) SizedBox(height: 5),
        CustomDropdown(
          hintText: hint,
          validator: (value) {
            if (value == null) {
              return 'Please select a value';
            }
            return null;
          },
          // decoration: DropdownTheme.dropdownDecoration(context),
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
