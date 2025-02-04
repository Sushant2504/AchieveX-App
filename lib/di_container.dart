import 'package:achievex/data/repository/app_setting_repo.dart';
import 'package:achievex/data/repository/authentication_repo.dart';
import 'package:achievex/data/repository/coupon_repo.dart';
import 'package:achievex/data/repository/demotivation_repo.dart';
import 'package:achievex/data/repository/feelinglow_repo.dart';
import 'package:achievex/data/repository/home_repo.dart';
import 'package:achievex/data/repository/notification_repo.dart';
import 'package:achievex/data/repository/timetable_repo.dart';
import 'package:achievex/data/repository/videos_repo.dart';
import 'package:achievex/provider/appdata_provider.dart';
import 'package:achievex/provider/auth_provider.dart';
import 'package:achievex/provider/category_provider.dart';
import 'package:achievex/provider/chat_provider.dart';
import 'package:achievex/provider/color_game_provider.dart';
import 'package:achievex/provider/content_provider.dart';
import 'package:achievex/provider/coupon_provider.dart';
import 'package:achievex/provider/demotivation_provider.dart';
import 'package:achievex/provider/feelinglow_provider.dart';
import 'package:achievex/provider/home_provider.dart';
import 'package:achievex/provider/notification_provider.dart';
import 'package:achievex/provider/schulte_table_provider.dart';
import 'package:achievex/provider/splash_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/provider/timer_provider.dart';
import 'package:achievex/provider/timetable_provider.dart';
import 'package:achievex/provider/tips_provider.dart';
import 'package:achievex/provider/videos_provider.dart';
import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/category_repo.dart';
import 'data/repository/content_repo.dart';
import 'data/repository/tips_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core

  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeRepo(dioClient: sl()));
  sl.registerLazySingleton(() => VideosRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AppRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ContentRepo(dioClient: sl()));
  sl.registerLazySingleton(
      () => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => TimetableRepo(dioClient: sl()));
  sl.registerLazySingleton(() => TipsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => DemotivationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FeelinglowRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CouponRepo(dioClient: sl()));

  // sl.registerLazySingleton(() => ChatProviderRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => AppModel());
  sl.registerFactory(() => CategoryProvider(categoryRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepo: sl()));
  sl.registerFactory(() => AppdataProvider(appRepo: sl()));
  sl.registerFactory(() => VideosProvider(videosRepo: sl()));
  sl.registerFactory(() => ContentProvider(contentRepo: sl()));
  sl.registerFactory(() => AppAuthProvider(authRepo: sl()));
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => TimetableProvider(timetableRepo: sl()));
  sl.registerFactory(() => TipsProvider(tipsRepo: sl()));
  sl.registerFactory(() => DemotivationProvider(demotivationRepo: sl()));
  sl.registerFactory(() => FeelinglowProvider(feelinglowRepo: sl()));
  sl.registerFactory(() => ChatProvider());
  sl.registerFactory(() => SchulteTableProvider());
  sl.registerFactory(() => TimerProvider());
  sl.registerFactory(() => ColorGameProvider());
  sl.registerFactory(() => SubscriptionProvider());
  sl.registerFactory(() => CouponProvider(couponRepo: sl()));

  // External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
