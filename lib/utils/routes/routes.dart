import 'package:achievex/data/model/response/category_model.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/11th_jee_advanced_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/11th_jee_advanced_maths.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/11th_jee_advanced_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/12th_jee_advanced_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/12th_jee_advanced_maths.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20ADVANCED/12th_jee_advanced_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_maths.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/12th_jee_main_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/12th_jee_main_maths.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/12th_jee_main_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/11th_neet_bio.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/11th_neet_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/11th_neet_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/12th_neet_bio.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/12th_neet_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/12th_neet_phy.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/all_questions.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/chapterwise_exam.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/explanation_screen.dart';
import 'package:achievex/screens/QuestionBank/NEET/full_test_names.dart';
import 'package:achievex/screens/QuestionBank/NEET/landing_page.dart';
import 'package:achievex/screens/QuestionBank/NEET/selectsubject_screen.dart';
import 'package:achievex/screens/QuestionBank/chapter_screen.dart';
import 'package:achievex/screens/QuestionBank/chooseexam_screen.dart';
import 'package:achievex/screens/QuestionBank/question_set_screen.dart';
import 'package:achievex/screens/QuestionBank/selectsubject_screen.dart';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:achievex/screens/brain_games/neuropractice/neuro_home_screen.dart';
import 'package:achievex/screens/category_screen.dart';
import 'package:achievex/screens/chess_game/main_menu_view.dart';
import 'package:achievex/screens/classes/class_2.dart';
import 'package:achievex/screens/color_game/color_game_result_screen.dart';
import 'package:achievex/screens/color_game/select_level_screen.dart';
import 'package:achievex/screens/courses_screen.dart';
import 'package:achievex/screens/home.dart';
import 'package:achievex/screens/classes/class_1.dart';
import 'package:achievex/screens/navigation.dart';
import 'package:achievex/screens/notes/notenest_screen.dart';
import 'package:achievex/screens/privacy_screen.dart';
import 'package:achievex/screens/QuestionBank/landing_page.dart';
import 'package:achievex/screens/refer_earn_screen.dart';
import 'package:achievex/screens/register_screen.dart';
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
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/result_screen.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/instruction_page.dart';

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
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.setting_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen());

      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());

      case RoutesName.verifyOtp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const VerifyOtpScreen());

      case RoutesName.neuroPractice:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NeuroHomeScreen());

      case RoutesName.categoryScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                CategoryScreen(categoryModel: CategoryModel()));

      case RoutesName.class1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Class_11());

      case RoutesName.class2:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Class_12());

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

      case RoutesName.choose_exam:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => ChooseexamScreen(
            Class: args['Class'],
          ),
        );

      case RoutesName.subjectname:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => SelectsubjectScreen(
                  Exam: args['Exam'],
                  Class: args['class'],
                ));

      case RoutesName.chapterscreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => ChapterScreen(
                  parameters: args['parameters'],
                  index: args['index'],
                ));

      case RoutesName.landingPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LandingPage());

      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Search());

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
            builder: (BuildContext context) =>
                const SchulteTableGameNormalScreen());

      case RoutesName.schulteTableScreenOneMinChallenge:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const SchulteTableGameOneMinChallengeScreen());

      case RoutesName.colorGameScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChooseColorLevelScreen());

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

      case RoutesName.noteNestScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => NotenestScreen(
                  screenIndex: 2,
                ));

      //fultesttopics...
      case RoutesName.fulltestneetchaptersScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const FullTestNames(),
        );

      //fulltest
      // case RoutesName.fulltestneet:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
        // );

      // case RoutesName.fulltestneetresult:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => fulltestneetresult(),
        // );

      // case RoutesName.fulltestjeemain:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
      //   );

      // case RoutesName.fulltestjeeadvanced:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
      //   );

      //fulltestresult....

      // case RoutesName.fulltestneetresult:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
      //   );

      // case RoutesName.fulltestjeemainreslt:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
      //   );

      // case RoutesName.fulltestjeeadvancedresult:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => FullNeetExam(),
      //   );

      //////
      ///
      ///
    
      
      // jee-main
      case RoutesName.eleventh_jeemain_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemainoneScreen(),
        );

      case RoutesName.eleventh_jeemain_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemaintwoScreen(),
        );

      case RoutesName.eleventh_jeemain_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemainthreeScreen(),
        );

      case RoutesName.twelth_jeemain_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemainfourScreen(),
        );

      case RoutesName.twelth_jeemain_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemainfiveScreen(),
        );

      case RoutesName.twelth_jeemain_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemainsixScreen(),
        );

      case RoutesName.eleventh_jeemain_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeemaintwoScreen(),
        );

      //jee-advanced

      case RoutesName.eleventh_jeeadvanced_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedoneScreen(),
        );

      case RoutesName.eleventh_jeeadvanced_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedtwoScreen(),
        );

      case RoutesName.eleventh_jeeadvanced_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedthreeScreen(),
        );

      case RoutesName.twelth_jeeadvanced_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedfourScreen(),
        );

      case RoutesName.twelth_jeeadvanced_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedfiveScreen(),
        );

      case RoutesName.twelth_jeeadvanced_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedsixScreen(),
        );

      // neet

      case RoutesName.eleventh_jeeadvanced_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedoneScreen(),
        );

      case RoutesName.eleventh_jeeadvanced_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedtwoScreen(),
        );

      case RoutesName.eleventh_jeeadvanced_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedthreeScreen(),
        );

      case RoutesName.twelth_jeeadvanced_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedfourScreen(),
        );

      case RoutesName.twelth_jeeadvanced_maths:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedfiveScreen(),
        );

      case RoutesName.twelth_jeeadvanced_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectjeeadvancedsixScreen(),
        );

      case RoutesName.eleventh_neet_bio:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneetoneScreen(),
        );

      case RoutesName.eleventh_neet_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneettwoScreen(),
        );

      case RoutesName.eleventh_neet_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneetthreeScreen(),
        );

      case RoutesName.twelth_neet_bio:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneetfourScreen(),
        );

      case RoutesName.twelth_neet_chem:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneetfiveScreen(),
        );

      case RoutesName.twelth_neet_phy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubjectneetsixScreen(),
        );

      //landing pages
      //
      case RoutesName.neetlandingPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LandingNeetPage(),
        );

      //questionsetscreen
      case RoutesName.selectneetsubject:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => SelectsubjectNeetScreen(
            Exam: args['Exam'],
            Class: args['Class'],
          ),
        );
      //

      case RoutesName.questionsetscreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => QuestionSetScreen(
            chapterset1: args['chapterset1'],
            chapterset2: args['chapterset2'],
            chapterset3: args['chapterset3'],
            subject: args['subject'],
          ),
        );

      //examsection
      case RoutesName.chapterwiseexam:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => ChapterwiseExam(
            Set: args['Set'],
            chapterset1: args['chapterset1'],
            chapterset2: args['chapterset2'],
            chapterset3: args['chapterset3'],
            subject: args['subject'],
          ),
      );

      //resultsection..
      //

      case RoutesName.resultscreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => ResultScreen(
            Set: args['Set'],
            chapterset1: args['chapterset1'],
            chapterset2: args['chapterset2'],
            chapterset3: args['chapterset3'],
            Questioncolor: args['Questioncolor'],
            marks: args['marks'],
            notanswered: args['notanswered'],
            correctanswered: args['correctanswered'],
            incorrectanswered: args['incorrectanswered'],
            timetaken: args['timetaken'],
            subject: args['subject'],
          ),
      );

      case RoutesName.instructionscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const InstructionPage(),
        );

      case RoutesName.allquestions:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => AllQuestions(
            paper: args['paper'],
          ),
        );

      //explanation

      case RoutesName.explanationscreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => ExaplanationScreen(
            paper: args['paper'],
            index: args['index'],
          ),
        );

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
