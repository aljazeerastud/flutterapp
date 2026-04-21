// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:awa/core/storage/data/storage.dart';
// import 'package:awa/core/storage/data/storage_impl.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
// // import 'package:hive_flutter/hive_flutter.dart';
//
//
// Future<void> initStorageInjection(GetIt sl) async {
//   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
//   await Hive.initFlutter(appDocumentDir.path);
//
//   Box<String> stringBox = await Hive.openBox<String>('stringBox');
//   Box<bool> boolBox = await Hive.openBox<bool>('boolBox');
//
//   sl.registerLazySingleton<FlutterSecureStorage>(()=> const FlutterSecureStorage());
//   sl.registerLazySingleton<Box<String>>(() => stringBox);
//   sl.registerLazySingleton<Box<bool>>(() => boolBox);
//
//   sl.registerLazySingleton<Storage>(()=> StorageImpl(boolBox: sl(), stringBox: sl(), secureStorage: sl()));
// }