import 'package:flutter/material.dart';

void appModalSheet({required BuildContext context, required Widget child, bool? showDragHandle}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      clipBehavior: Clip.hardEdge,
      showDragHandle: showDragHandle,
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.75, 
      builder: (context) => child
    );
  }