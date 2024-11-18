import 'dart:async';
import 'package:achievex/data/network/firebase_api.dart';
import 'package:achievex/notification_controller.dart';
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
import 'package:achievex/screens/chess_game/logic/shared_functions.dart';
import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/notes/notenest_screen.dart';
import 'package:achievex/screens/select_role_screen.dart';
import 'package:achievex/screens/color_game/start_color_game_screen.dart';
import 'package:achievex/screens/splash_screen.dart';
import 'package:achievex/screens/verify_otp.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'di_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Otpless _otpless = Otpless();
  // _otpless.init();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBziakVRIh1CalZ7sxITWLNsTUeJaXGTcU",
    projectId: "achievex-e3780",
    messagingSenderId: "674951664796",
    appId: "1:674951664796:android:f471db96dc577fba024959",
  ));

  NotificationService().initNot();

  FirebaseApi firebaseApi = FirebaseApi();

  firebaseApi.requestPermission();

  // Admob.initialize();

  firebaseApi.getDeviceToken().then((value) => {});

  await di.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<AppModel>()),
        ChangeNotifierProvider(create: (context) => di.sl<CategoryProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AppdataProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<VideosProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ContentProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AppAuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<NotificationProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<TimetableProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<TipsProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<DemotivationProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<FeelinglowProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<SchulteTableProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<TimerProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ColorGameProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<SubscriptionProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CouponProvider>()),
      ],
      child: const MyApp(),
    ),
  );
  _loadFlameAssets();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  

    // AwesomeNotifications().setListeners(onActionReceivedMethod: NotificationController.onA(receivedNotification))
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AchieveX',
      color: AppColors.backgroundColor,
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(color: Colors.redAccent),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      home: const SplashScreen(),
      routes: {
        '/verify_otp': (context) =>  VerifyOtpScreen(),
        '/select_role': (context) => const SelectRoleScreen(),
        '/start_color_game_screen': (context) => const StarColorGameScreen(),
        '/note_nest_screen': (context) => NotenestScreen(
              screenIndex: 2,
            ),
        // '/video_screen' : (context) => const VideoScreen()
      },
    );
  }

 
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}

void _loadFlameAssets() async {
  List<String> pieceImages = [];
  for (var theme in PIECE_THEMES) {
    for (var color in ['black', 'white']) {
      for (var piece in ['king', 'queen', 'rook', 'bishop', 'knight', 'pawn']) {
        pieceImages
            .add('pieces/${formatPieceTheme(theme)}/${piece}_$color.png');
      }
    }
  }
  await Flame.images.loadAll(pieceImages);
}
