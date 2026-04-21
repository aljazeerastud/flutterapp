// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// // import 'package:awa/core/extensions/app_localization_extension.dart';
//
// class Validator {
//   static String? defaultValidator(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     return null;
//   }
//
//   static String? name(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     return null;
//   }
//
//   static String? dateOfBirth(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     return null;
//   }
//
//   static String? checkBox(bool? value, BuildContext context) {
//     if (value == null || !value) {
//       return context.l10n.errorFieldRequired;
//     }
//     return null;
//   }
//
//   static String? text(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (!RegExp('[a-zA-Z]').hasMatch(value)) {
//       return context.l10n.errorInvalidName;
//     }
//     return null;
//   }
//
//   static String? hasValidUrl(String? value, BuildContext context) {
//     const pattern =
//         r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (!RegExp(pattern).hasMatch(value)) {
//       return context.l10n.errorInvalidUrl;
//     }
//     return null;
//   }
//
//   static String? phoneValidator(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (!RegExp(r'^\+?[0-9()-\s]{3,20}$').hasMatch(value)) {
//       return context.l10n.errorInvalidPhoneNumber;
//     }
//     return null;
//   }
//
//   static String? email(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
//       return context.l10n.errorInvalidEmail;
//     }
//     return null;
//   }
//
//   static String? password(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (value.length < 8 ||
//         !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9#?!@$%^&*-]).{8,}$')
//             .hasMatch(value)) {
//       return context.l10n.errorInvalidPassword;
//     }
//     return null;
//   }
//
//   static String? confirmPassword(
//       String? confirmPassword, String? password, BuildContext context) {
//     if (confirmPassword == null || confirmPassword.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     if (confirmPassword != password) {
//       return context.l10n.errorPasswordMismatch;
//     }
//     return null;
//   }
//
//   static String? numbers(String? value, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     final sanitizedValue = value.startsWith("+") ? value.replaceFirst("+", "") : value;
//     if (int.tryParse(sanitizedValue) == null) {
//       return context.l10n.errorInvalidNumber;
//     }
//     return null;
//   }
//
//   static String? phone(String? value, PhoneModel model, BuildContext context) {
//     if (value == null || value.trim().isEmpty) {
//       return context.l10n.errorFieldRequired;
//     }
//     final sanitizedValue = value.replaceAll(' ', '').trim();
//     if (!sanitizedValue.startsWith(model.startWith) ||
//         sanitizedValue.length != model.startWith.length + model.length) {
//       return context.l10n.errorPhoneValidation.toString()
//           .replaceFirst('{start}', model.startWith)
//           .replaceFirst('{length}', model.length.toString());
//     }
//     return null;
//   }
// }
//
// class PhoneModel extends Equatable {
//   final String startWith;
//   final int length;
//
//   const PhoneModel({required this.length, required this.startWith});
//
//   @override
//   List<Object?> get props => [length, startWith];
// }
