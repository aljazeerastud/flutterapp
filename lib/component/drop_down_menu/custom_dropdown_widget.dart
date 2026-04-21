// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:soft_link/component/drop_down_menu/DDCodeListModel.dart';
// class CustomDropDownWidget extends StatelessWidget {
//   const CustomDropDownWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch<DDCodeListModel>(
//       selectedItem: DDCodeListModel(v: '', d: ''),
//       clearButtonProps: ClearButtonProps(isVisible: true),
//       popupProps: PopupProps.menu(
//           searchDelay: const Duration(seconds: 1),
//           menuProps: const MenuProps(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(24),
//               ),
//             ),
//           ),
//           searchFieldProps: TextFieldProps(
//             // textDirection: TextDirection.rtl,
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//             decoration: InputDecoration(
//               border: const OutlineInputBorder(),
//               contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
//               labelText: "search",
//             ),
//           ),
//           itemBuilder:
//               (BuildContext context, DDCodeListModel? item, bool isSelected) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: !isSelected
//                   ? null
//                   : BoxDecoration(
//                 border: Border.all(color: Theme.of(context).primaryColor),
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//               ),
//               child: ListTile(
//                 selected: isSelected,
//                 title: Text(item?.d.toString() ?? ''),
//                 subtitle: Text(item?.v?.toString() ?? ''),
//                 leading: CircleAvatar(
//                   backgroundColor: Theme.of(context).colorScheme.primary,
//                   child: Center(
//                     child: Icon(
//                       Icons.sensor_occupied_sharp,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           showSearchBox: true,
//           showSelectedItems: true),
//       enabled: true,
//       // asyncItems: (String? filter) => cubit.getCodeList(),
//       compareFn: (item, selectedItem) => item.v == selectedItem.v,
//       dropdownDecoratorProps: DropDownDecoratorProps(
//         dropdownSearchDecoration: InputDecoration(
//           labelText: "",
//           hintText: "",
//           contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 8),
//           border: const OutlineInputBorder(),
//         ),
//       ),
//       onChanged: (DDCodeListModel? data) {},
//     );
//   }
// }
