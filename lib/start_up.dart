import 'dart:io';

import 'package:awa/core/bloc/bloc_observer.dart';
import 'package:awa/shared/local/cache_helper.dart';
import 'package:awa/shared/network/dio_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:awa/component/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as injection;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
class StartUp {
  static StartUp? _instance;
  StartUp._() {}
  static StartUp? get instance {
    if (_instance != null) return _instance;
    return _instance = StartUp._();
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    await injection.init();

    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to transparent
    ));
    Bloc.observer = MyBlocObserver();
    HttpOverrides.global = MyHttpOverrides();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = [];
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor:
      ColorManager.backgroundColor
      ),
    );


    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //     statusBarColor: Colors.transparent, // Color for Android
    //     statusBarBrightness:
    //         Brightness.light // Dark == white status bar -- for IOS.
    //     ));
    // await Future.wait([,]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await CacheHelper.init();
    // DioHelper.init();

  }
}
