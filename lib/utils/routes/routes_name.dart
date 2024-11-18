import 'dart:convert';

import '../../data/model/response/category_model.dart';


class RoutesName {
  
  static const String login = "login_screen";

  static const String setting_screen = "setting_screen";

  static const String choose_exam = "choose_exam";

  static const String register = "register_screen";

  static const String neuroPractice = "neuro_practice_screen";

  static const String home = "home_screen";

  static const String splash = "splash_screen";

  static const String start_journey = "start_journey_screen";

  static const String verifyOtp = "verify_otp";

  static const String class1 = "class1";

  static const String class2 = "class2";

  static const String repeat = "repeat";

  static const String pcm = "pcm";

  static const String pcb = "pcb";

  static const String Instruction = "Instruction";

  static const String AnalysisScreen =  "AnalysisScreen";

  static const String landingPage = "landingpage";

  static const String categoryScreen = "category_screen";

  static String getCategoryRoute({required CategoryModel categoryModel}) {
    String data =
        base64Url.encode(utf8.encode(jsonEncode(categoryModel.toJson())));
    return '$categoryScreen?category_screen=$data';
        
        print("category model is called !");
  }

  static const String selectRole = "select_role_screen";

  static const String search = "search";

  static const String writeYourPost = "write_your_post";

  static const String navigation = "navigation";

  static const String courseScreen = "courses_screen";

  static const String watchCourseScreen = "watch_courses_screen";

  static const String referEarnScreen = "refer_earn_screen";

  static const String notificationScreen = "notification_screen";

  static const String privacyPolicyScreen = "privacy_policy_screen";

  static const String subscriptionScreen = "subscription_screen";

  static const String gamesScreen = "games_screen";

  static const String brainGameScreen = "brain_game_screen";

  static const String schulteTableScreenNormal = "games_screen_normal";

  static const String schulteTableScreenOneMinChallenge =
      "games_screen_one_min_challenge";

  static const String schulteTableScreen = "schulte_screen";

  static const String resultScreen = "result_screen";

  static const String colorGameScreen = "color_game_screen";

  static const String startcolorGameScreen = "start_color_game_screen";

  static const String chessHomeScreen = "main_menu_view";

  static const String sudokuHomeScreen = "sudoku_home_screen";

  static const String colorGameResultScreen = "color_game_result_screen";

  static const String instructiontScreen = "instruction_screen";

  static const String QuestionwiseScreen = "questionwise_screen";

  static const String scheduleScreen = "schedule_screen";

  static const String noteNestScreen = "note_nest_screen";

  static const String MindMapScreen = "mind_map_screen";

  static const String QuestionereScreen = "quetionere_screen";

  static const String class11phy = "class11phy";

  static const String class11chem = "class11chem";

  static const String class11math = "class11math";

  static const String class11bio = "class11bio";

  static const String Class12Phy = "class12Phy";

  static const String Class12Chem = "class12Chem";

  static const String Class12Math = "class12Math";

  static const String Class12Bio = "class12Bio";
  
}
