import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const String _path = 'assets/icons/';

  // Icon paths
  static const String success = '${_path}success.svg';
  static const String warning = '${_path}warning.svg';
  static const String error = '${_path}error.svg';
  static const String attachment = '${_path}attachment.svg';
  static const String calendar = '${_path}calendar.svg';
  static const String eye = '${_path}eye.svg';
  static const String filter = '${_path}filter.svg';
  static const String link = '${_path}Link.svg';
  static const String lock = '${_path}lock.svg';
  static const String magnifyingGlassOutline = '${_path}magnifying-glass_outline.svg';
  static const String popup = '${_path}Popup.svg';
  static const String small = '${_path}small.svg';
  static const String u1 = '${_path}u1.svg';
  static const String contactUs = '${_path}contact-us.svg';
  static const String unseenEye = '${_path}unseen_eye.svg';
  static const String seenEye = '${_path}seen_eye.svg';
  static  String closeIcon = "${_path}close.png";
  static  String doneIcon = "${_path}done.png";
  static  String ratIcon = "${_path}rate.png";
  static  String dropIcon = "${_path}drop.png";
  static  String goOnlineIcon = "${_path}goOnline.png";
  static  String ticketIcon = "${_path}ticket.png";
  static String  galleryIcon = "${_path}photos.svg";
  static String  cameraIcon = "${_path}camera.svg";
  static String  folder = "${_path}folder.svg";

  // Method to render SVG as a widget
  static Widget icon({required String icon, double size = 24, Color? color,}) =>  SvgPicture.asset(
    icon,
    width: size,
    height: size,
    colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  );
}