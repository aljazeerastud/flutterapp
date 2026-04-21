import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class TextFormFieldPhone extends StatelessWidget {
  final TextEditingController phoneController;
  final String hintText;
  final TextEditingController? countryCodeController;
  final String? Function(String?)? validator;
  final TextStyle ? hintStyle;
  final InputBorder ? border;
  final InputBorder ? enabledBorder;
  final InputBorder ? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  const TextFormFieldPhone({
    required this.hintText,
    required this.phoneController,
    this.validator,
    this.countryCodeController,
    super.key, this.border, this.enabledBorder, this.focusedBorder, this.hintStyle, this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      maxLines: 1,
      minLines: 1,
      validator: validator,
      cursorHeight: 20,
      style: TextStyles.textViewBold16,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primaryColor,
      onTapOutside: (_) {FocusManager.instance.primaryFocus?.unfocus();},
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor:AppColors.white,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        hintText: hintText,
        hintStyle:hintStyle?? TextStyles.textViewRegular14,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        contentPadding:contentPadding?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        prefixIcon: countryCodeController != null ? CountryCodePicker(
          onChanged: (value) {
            countryCodeController!.text = value.dialCode.toString();
          },
          closeIcon: const Icon(Icons.close, color: AppColors.white,),
          initialSelection: 'iq',
          showCountryOnly: true,
          padding: EdgeInsets.symmetric(horizontal: 5),
          textStyle:TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color, fontSize: 16, fontWeight: FontWeight.w400),
          barrierColor: AppColors.darkBackground.withOpacity(0.5),
          dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: AppColors.white,
          searchDecoration: InputDecoration(
            prefixIconColor: AppColors.primaryColor,
            fillColor: Theme.of(context).cardColor,
            filled: true,
            contentPadding: EdgeInsets.zero,
          ),
        ):null,
      ),
    );
  }
}