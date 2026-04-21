import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awa/component/color_manger.dart';
import 'package:awa/component/styles_manager.dart';

openSelectLanguage(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: CupertinoActionSheet(
            cancelButton: CupertinoButton(
              child: Text(
                "إلغاء",
                style:  TextStyle( color: ColorManager.error),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "إختار اللغة",
                    style: getBoldStyle(
                      fontSize: 18,
                      color: ColorManager.darkPrimary,

                    ),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "اللغة العربية",
                  style:  getBoldStyle(color: ColorManager.black),
                ),
                onPressed: () {
                },
              ),
              TextButton(
                child: Text("الإنجليزى",   style:  getBoldStyle(color: ColorManager.black),),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
openLogout(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: CupertinoActionSheet(
            cancelButton: CupertinoButton(
              child: Text(
                "إلغاء",
                style:  TextStyle( color: ColorManager.error),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "هل تريد الخروج من التطبيق",
                    style: getBoldStyle(
                      fontSize: 16,
                      color: ColorManager.darkPrimary,

                    ),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "موافق",
                  style:  getBoldStyle(color: ColorManager.black),
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

openDeleteAccount(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: CupertinoActionSheet(
            cancelButton: CupertinoButton(
              child: Text(
                "إلغاء",
                style:  TextStyle( color: ColorManager.error),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "هل تريد حذف الحساب ؟ ",
                    style: getBoldStyle(
                      fontSize: 16,
                      color: ColorManager.darkPrimary,

                    ),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "موافق",
                  style:  getBoldStyle(color: ColorManager.black),
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}