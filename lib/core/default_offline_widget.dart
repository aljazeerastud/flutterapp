import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class DefaultOfflineWidget extends StatelessWidget {
  const DefaultOfflineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 48,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  'no_internet_connection'.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
