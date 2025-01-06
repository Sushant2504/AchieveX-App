import 'dart:convert';

import '../../data/model/response/category_model.dart';


class RoutesName {

 // Routesname


  
  static const String login = "login_screen";

  static const String setting_screen = "setting_screen";

  static const String choose_exam = "choose_exam";

  static const String chapterscreen = "chapterscreen";

  static const subjectname =  "subjectname";

  static const String register = "register_screen";

  static const String neuroPractice = "neuro_practice_screen";

  static const String instruction = "instruction";

  static const String questionbank = "questionbank";

  static const String home = "home_screen";

  static const String splash = "splash_screen";

  static const String start_journey = "start_journey_screen";
 
  static const String eleventh_jeemain_maths = "eleventh_jeemain_maths";

  static const String eleventh_jeemain_chem = "eleventh_jeemain_chem";

  static const String eleventh_jeemain_phy = "eleventh_jeemain_phy";

  static const String twelth_jeemain_maths = "twelth_jeemain_maths";

  static const String twelth_jeemain_chem = "twelth_jeemain_chem";

  static const String twelth_jeemain_phy = "twelth_jeemain_phy";

  static const String eleventh_jeeadvanced_maths = "eleventh_jeeadvanced_maths";

  static const String eleventh_jeeadvanced_chem = "eleventh_jeeadvanced_chem";

  static const String eleventh_jeeadvanced_phy = "eleventh_jeeadvanced_phy";

  static const String twelth_jeeadvanced_maths = "twelth_jeeadvanced_maths";

  static const String twelth_jeeadvanced_chem = "twelth_jeeadvanced_chem";

  static const String twelth_jeeadvanced_phy = "twelth_jeeadvanced_phy";

  static const String questionsetscreen = "questionsetscreen";

  static const String eleventh_neet_bio = "eleventh_jeeadvanced_bio";

  static const String eleventh_neet_phy = "eleventh_jeeadvanced_phy";

  static const String eleventh_neet_chem = "eleventh_neet_chem";

  static const String twelth_neet_phy = "twelth_neet_phy";

  static const String twelth_neet_chem = "twelth_neet_chem";

  static const String twelth_neet_bio = "twelth_neet_bio";


  //resultsection

  static const String resultscreen = "resultscreen";

  static const String instructionscreen = "instructionscreen";

  static const String allquestions = "allquestions";

  static const String explanationscreen = "explanationscreen";
  //examsection

  static const String chapterwiseexam = "chapterwiseexam";

  static const String fulltestexam = "fulltestexam";

  static const String class1 = "class1";

  static const String class2 = "class2";

  static const String repeat = "repeat";

  static const String pcm = "pcm";

  static const String pcb = "pcb";

  static const String AnalysisScreen =  "AnalysisScreen";


  static const String backgroundinstructions = "backgroundinstructions";

  //landing pages,...

  static const String landingPage = "landingpage";

  static const String neetlandingPage = "neetlandingPage";

  //fullchapterscreen

  static const String fulltestneetchaptersScreen = "fulltestchaptersScreen";

  //fulltest screens..

  static const String fulltestneet = "fulltestneet";

  static const String fulltestjeemain = "fulltestjeemain";

  static const String fulltestjeeadvanced = "fulltestjeeadvanced";

  //fulltestresult....

  static const String fulltestneetresult = "fulltestneetresult";

  static const String fulltestjeemainreslt = "fulltestjeemainresult";

  static const String fulltestjeeadvancedresult = "fulltestjeeadvancedresult";


  static const String selectneetsubject = "selectneetsubject";


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

  static const String solutionscreen = "solutionscreen";

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
  
  static const String questionwise = "questionwise";

  static const String questionwisescreen = "questionwisescreen";

  static const String scheduleScreen = "schedule_screen";

  static const String noteNestScreen = "note_nest_screen";

  static const String MindMapScreen = "mind_map_screen";

  static const String class11phy = "class11phy";

  static const String class11chem = "class11chem";

  static const String class11math = "class11math";

  static const String class11bio = "class11bio";

  static const String Class12Phy = "class12Phy";

  static const String Class12Chem = "class12Chem";

  static const String Class12Math = "class12Math";

  static const String Class12Bio = "class12Bio";

  static const String verifyOtp = "varifyOtp";
  
}
