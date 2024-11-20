import 'package:achievex/data/model/response/category_model.dart';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:achievex/screens/brain_games/neuropractice/neuro_home_screen.dart';
import 'package:achievex/screens/category_screen.dart';
import 'package:achievex/screens/chess_game/main_menu_view.dart';
import 'package:achievex/screens/choose_exam.dart';
import 'package:achievex/screens/class%2011/class_11_bio.dart';
import 'package:achievex/screens/class%2011/class_11_chem.dart';
import 'package:achievex/screens/class%2011/class_11_maths.dart';
import 'package:achievex/screens/class%2011/class_11_phy.dart';
import 'package:achievex/screens/class%2012/class_12_bio.dart';
import 'package:achievex/screens/class%2012/class_12_chem.dart';
import 'package:achievex/screens/class%2012/class_12_maths.dart';
import 'package:achievex/screens/class%2012/class_12_phy.dart';
import 'package:achievex/screens/classes/class_2.dart';
import 'package:achievex/screens/color_game/color_game_result_screen.dart';
import 'package:achievex/screens/color_game/instruction_screen.dart';
import 'package:achievex/screens/color_game/select_level_screen.dart';
import 'package:achievex/screens/courses_screen.dart';
import 'package:achievex/screens/home.dart';
import 'package:achievex/screens/classes/class_1.dart';
import 'package:achievex/screens/navigation.dart';
import 'package:achievex/screens/notes/notenest_screen.dart';
import 'package:achievex/screens/privacy_screen.dart';
import 'package:achievex/screens/question_bank/QuestionWise.dart';
import 'package:achievex/screens/question_bank/instruction_screen.dart';
import 'package:achievex/screens/question_bank/landing_page.dart';
import 'package:achievex/screens/question_bank/question_bank_screen.dart';
import 'package:achievex/screens/refer_earn_screen.dart';
import 'package:achievex/screens/register_screen.dart';
import 'package:achievex/screens/result_screen.dart';
import 'package:achievex/screens/schedule_timetable/schedule_screen.dart';
import 'package:achievex/screens/schulte_game/schulte_game_screen.dart';
import 'package:achievex/screens/schulte_game/schulte_game_screen_normal.dart';
import 'package:achievex/screens/schulte_game/schulte_game_screen_one_min_challenge.dart';
import 'package:achievex/screens/search.dart';
import 'package:achievex/screens/select_role_screen.dart';
import 'package:achievex/screens/setting_screen.dart';
import 'package:achievex/screens/splash_screen.dart';
import 'package:achievex/screens/color_game/start_color_game_screen.dart';
import 'package:achievex/screens/start_journey_screen.dart';
import 'package:achievex/screens/subscription_screen.dart';
import 'package:achievex/screens/sudoku_game/sudoku_home_screen.dart';
import 'package:achievex/screens/verify_otp.dart';
import 'package:achievex/screens/watch_course_screen.dart';
import 'package:achievex/screens/write_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import '../../screens/login_screen.dart';
import '../../screens/notification_screen.dart';
import 'package:achievex/screens/question_bank/analysis_result.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyHomePage(
                  title: 's',
                ));

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
            
      case RoutesName.setting_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen());

      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen());

      case RoutesName.verifyOtp:
        return MaterialPageRoute(
            builder: (BuildContext context) => VerifyOtpScreen());

      case RoutesName.AnalysisScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => AnalysisResult());

      case RoutesName.neuroPractice:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NeuroHomeScreen());

      case RoutesName.QuestionwiseScreen:
        return MaterialPageRoute(builder: (BuildContext context) =>  Questionwise());   

      case RoutesName.categoryScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                CategoryScreen(categoryModel: CategoryModel()));

      case RoutesName.class1:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  Class_11());

      case RoutesName.class2:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  Class_12());

      case RoutesName.start_journey:
        return MaterialPageRoute(
            builder: (BuildContext context) => const StartJourneyScreen());

      case RoutesName.selectRole:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SelectRoleScreen());

      case RoutesName.navigation:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Navigation());

      case RoutesName.courseScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CourseScreen());

      // case RoutesName.pcm:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PCM());

      // case RoutesName.pcb:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PCB());

      case RoutesName.choose_exam:
        return MaterialPageRoute(builder: (BuildContext context) => ChooseExam());            

      case RoutesName.landingPage:
        return MaterialPageRoute(builder: (BuildContext context) => LandingPage()); 

      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Search());

      case RoutesName.QuestionereScreen:
        return MaterialPageRoute(builder: (BuildContext context) => QuestionBankScreen());

      case RoutesName.writeYourPost:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WriteYourPost());

      case RoutesName.watchCourseScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WatchCourseScreen());

      case RoutesName.referEarnScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ReferEarnScreen());

      case RoutesName.notificationScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationScreen());

      case RoutesName.privacyPolicyScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => PrivacyPolicyScreen(
                  title: '',
                ));

      case RoutesName.subscriptionScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SubscriptionScreen());

      case RoutesName.schulteTableScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SchulteTableGameScreen());

      case RoutesName.schulteTableScreenNormal:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SchulteTableGameNormalScreen());

      case RoutesName.schulteTableScreenOneMinChallenge:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const SchulteTableGameOneMinChallengeScreen());

      case RoutesName.Instruction:
        return MaterialPageRoute(
          builder: (BuildContext context) => 
               InstructionPage());     

      case RoutesName.resultScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ResultScreen(
                  resultTime: '',
                  count: "0",
                ));

      case RoutesName.colorGameScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChooseColorLevelScreen());

      case RoutesName.startcolorGameScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const StarColorGameScreen());

      case RoutesName.chessHomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainMenuView());

      case RoutesName.sudokuHomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SudokuHomeScreen());

      case RoutesName.brainGameScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BrainGameScreen());

      case RoutesName.colorGameResultScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ColorGameResultScreen());

      case RoutesName.scheduleScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ScheduleScreen());

      case RoutesName.class11phy:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Class11PhyScreen());  

      case RoutesName.class11chem:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class11Chemistry()); 

      case RoutesName.class11math:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class11Maths());

      case RoutesName.class11bio:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class11Bio());     

      case RoutesName.Class12Phy:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class12Phy());   

      case RoutesName.Class12Chem:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class12Chem());  

      case RoutesName.Class12Math:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class12Maths());

      case RoutesName.Class12Bio:
        return MaterialPageRoute(
            builder: (BuildContext context) => Class12Bio());            


      case RoutesName.noteNestScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => NotenestScreen(
                  screenIndex: 2,
                ));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Definded."),
            ),
          );
        });
    }
  }
}
