// import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// // import 'package:awa/core/extensions/app_localization_extension.dart';
// import '../constant/app_colors.dart';
// import '../constant/app_icons.dart';
// import '../constant/styles/text_styles.dart';
// import '../constant/styles/text_utils.dart';
//
// void showPopupMenu({
//   required Offset offset,
//   required BuildContext context,
//    Function()? onTapPhoto,
//    Function()? onTapCamera,
//    Function()? onTapFile,
//   bool isFilesEnabled = false,
// }) async {
//
//   final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
//
//   await showMenu<int>(
//     context: context,
//     color: Theme.of(context).cardColor,
//     surfaceTintColor: AppColors.transparent,
//     shadowColor: AppColors.transparent,
//     clipBehavior: Clip.hardEdge,
//     elevation: 0,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.r),
//         side: const BorderSide(color:AppColors.white)
//     ),
//     position: RelativeRect.fromRect(
//       offset & const Size(40, 40), // small rectangle to anchor the popup menu
//       Offset.zero & overlay.size, // The entire screen
//     ),
//
//     items: <PopupMenuEntry<int>> [
//       PopupMenuItem<int>(
//         onTap: onTapPhoto,
//         padding: EdgeInsets.symmetric(horizontal: 15.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(context.l10n.photoLibrary, style: TextStyles.textViewBold14.copyWith(
//               fontWeight: semiBold,
//             ),),
//             SizedBox(width: 30.w,),
//             SvgPicture.asset(AppIcons.galleryIcon, width: 22.w,
//                 colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
//             )
//           ],
//         ),
//       ),
//       const PopupMenuDivider(),
//       PopupMenuItem<int>(
//         onTap: onTapCamera,
//         padding: EdgeInsets.symmetric(horizontal: 15.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(context.l10n.takePhotoOrVideo, style: TextStyles.textViewBold14.copyWith(
//               fontWeight: semiBold,
//             ),),
//             SizedBox(width: 30.w,),
//             SvgPicture.asset(AppIcons.cameraIcon, width: 22.w,
//                 colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
//             )
//           ],
//         ),
//       ),
//       if (isFilesEnabled == true)...[
//         const PopupMenuDivider(),
//         PopupMenuItem<int>(
//           onTap: onTapFile,
//           padding: EdgeInsets.symmetric(horizontal: 15.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(context.l10n.chooseFiles, style: TextStyles.textViewBold14.copyWith(
//                 fontWeight: semiBold,
//               ),),
//               SizedBox(width: 30.w,),
//               SvgPicture.asset(AppIcons.folder, width: 22.w,
//                   colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
//
//               )
//             ],
//           ),
//         ),
//       ]
//     ],
//   );
// }