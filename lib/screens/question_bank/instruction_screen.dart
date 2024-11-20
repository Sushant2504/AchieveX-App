import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

List<String> Instructions = [
  'Duration: This test is of 1 hour duration.',
  'Marking Scheme: \nEach correct answer carries +4 marks. \n Each incorrect answer carries -1 mark. \n No marks will be awarded for \n unattempted questions.',
  'User Interface: \n The test will be conducted in online mode. \n You will be presented with questions one at a time. \n Use the provided options to select your answer. \n Once you select an answer, you cannot change it.',
  'Exam Conduct: \n Maintain honesty and integrity throughout the test. \n Avoid any malpractice or unfair means.',
  'Exam Level: \n Question Type: Straightforward questions \n testing basic concepts. \n Strategy: Quickly solve these to build \n confidence and momentum.',
  'Exam Level: \n Question Type: A mix of straightforward \n and analytical questions. + DifficultyMessage[1] + \n Strategy: Quickly solve some \n questions and think for some. \n confidence and momentum.',
  'Exam Level: \n Question Type: Complex and challenging \n questions requiring critical thinking. \n Strategy: Quickly solve by thinking for \n some and anyalise for some \n confidence and momentum.',
  'Post-Exam Guidelines: \n Once the test is completed, submit your answers. \n You will be able to review your performance \nafter the test'
];

final TextEditingController _controller = TextEditingController();
bool _isButtonEnabled = false;

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkInput);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 50,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: const TabBar(
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Text("Easy"),
                    Text("Medium"),
                    Text("Hard"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: InstructionEasy(height, width, context)),
            Center(child: InstructionMedium(height, width, context)),
            Center(child: InstructionHard(height, width, context)),
          ],
        ),
      ),
    );
  }

  Widget InstructionEasy(var height, var width, context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Ready For',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Exam',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/exam.jpg',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Here are a some Instruction before you start exam:',
                          style: TextStyle(
                              fontFamily: 'Promt-Bold',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      Sentence(Instructions[0]),
                      Sentence(Instructions[1]),
                      Sentence(Instructions[2]),
                      Sentence(Instructions[3]),
                      Sentence(Instructions[4]),
                      Sentence(Instructions[7]),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LastButton(height, width, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InstructionMedium(var height, var width, context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Ready For',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Exam',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Prompt-Bold',
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/exam.jpg',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Here are a some Instruction before you start exam:',
                          style: TextStyle(
                              fontFamily: 'Promt-Bold',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      Sentence(Instructions[0]),
                      Sentence(Instructions[1]),
                      Sentence(Instructions[2]),
                      Sentence(Instructions[3]),
                      Sentence(Instructions[5]),
                      Sentence(Instructions[7]),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LastButton(height, width, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InstructionHard(var height, var width, context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Ready For',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Exam',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/exam.jpg',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Here are a some Instruction before you start exam:',
                          style: TextStyle(
                              fontFamily: 'Promt-Bold',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      Sentence(Instructions[0]),
                      Sentence(Instructions[1]),
                      Sentence(Instructions[2]),
                      Sentence(Instructions[3]),
                      Sentence(Instructions[6]),
                      Sentence(Instructions[7]),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LastButton(height, width, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Sentence(String temp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, top: 10),
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            temp,
            style: const TextStyle(
                fontFamily: 'Promt',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 13),
          ),
        ),
      ],
    );
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _controller.text.trim() == 'AchieveX';
    });
  }

  Widget LastButton(var height, var width, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.63,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type AchieveX to start',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Container(
            height: height * 0.05,
            width: width * 0.25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 5),
            child: Center(
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, RoutesName.QuestionereScreen),
                child: const Text(
                  'Start Exam',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt-Bold',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
