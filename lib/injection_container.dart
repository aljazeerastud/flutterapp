import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// import 'package:haya_driver/modules/auth/auth_inj.dart';
// import 'package:haya_driver/modules/my_rides/presentation/my_ride_inj.dart';
// import 'package:haya_driver/modules/wallet/wallet_inj.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/services/media_service/media_service_impl.dart';
import 'core/services/media_service/media_services.dart';
import 'core/storage/storage_inj.dart';
import 'core/api_service/api_basehelper.dart';
// import 'core/utils/app_navigator.dart';
// import 'modules/home/home_injic.dart';
// import 'modules/home/socket_injic.dart';
// import 'modules/profile/profile_injiction.dart';
// import 'modules/tickets/tickets_injiction_container.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // await initStorageInjection(sl);
  // initAuthInjection(sl);
  // initWalletInjection(sl);
  // initMyRideInjection(sl);
  // initSocketInjection(sl);
  // profileInjiection(sl);
  // initHomeInjection(sl);
  // initTicketsInjectionContainer(sl);
  // core
  // sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  sl.registerLazySingleton<MediaService>(() => MediaServiceImpl());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerFactory<ApiBaseHelper>(() => ApiBaseHelper());
}