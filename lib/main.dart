import 'package:awa/core/connective_tracker.dart';
import 'package:awa/core/default_offline_widget.dart';
import 'package:awa/core/route_page.dart';
import 'package:awa/start_up.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async{
  await StartUp.instance!.init();
  runApp(    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translation', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      startLocale: Locale('en'),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ConnectivityTracker(
      offlineWidget: DefaultOfflineWidget(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: routerPage,

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

