import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ResultsScreen extends StatefulWidget {
  final List<int> scores;

  const ResultsScreen({super.key, required this.scores});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late int totalScore;

  @override
  void initState() {
    super.initState();
    totalScore = widget.scores.reduce((a, b) => a + b); // Calculate total score
  }

  final Map<String, List<String>> tagLines = {
    "1_star": [
      "You really need to practice it every day.",
      "Unlock your potential with our brain test, there's room to grow.",
      "Good things take time, keep practicing every day."
    ],
    "2_star": [
      "Discover new strengths and sharpen your mind with our Neurospectrum.",
      "Keep pushing hard, your chances of improvement are too high.",
      "You're on the path to greatness – keep pushing hard with our Neurospectrum."
    ],
    "3_star": [
      "You're on the right track – keep honing your skills with our Neurospectrum.",
      "You're halfway there – see how far you can go with our Neurospectrum.",
      "You're in the zone – keep the momentum going with our Neurospectrum."
    ],
    "4_star": [
      "Congratulations, you're a brainiac! Test your limits with our Neurospectrum.",
      "Impress yourself with your cognitive prowess.",
      "Genius level unlocked! Test your brainpower even further with our Neurospectrum."
    ],
    "5_star": [
      "You're on fire! Push your boundaries with our Neurospectrum.",
      "You're a cognitive powerhouse – see how far you can go with our Neurospectrum.",
      "You're unstoppable! Keep challenging yourself with our Neurospectrum and dominate the leaderboard."
    ],
    "10_star": ["Limitless.."]
  };

  String getRandomTagline() {
    String key;
    if (totalScore < 200) {
      key = "1_star";
    } else if (totalScore < 400) {
      key = "2_star";
    } else if (totalScore < 600) {
      key = "3_star";
    } else if (totalScore < 800) {
      key = "4_star";
    } else if (totalScore < 1000) {
      key = "5_star";
    } else {
      key = "10_star";
    }

    List<String> lines = tagLines[key]!;
    Random random = Random();
    return lines[random.nextInt(lines.length)];
  }

  Widget summaryItem(
    double height,
    double width,
    Color color,
    Color textColor,
    String imagePath,
    String title,
    String score,
  ) {
    return Container(
      height: height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: height * 0.05,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: width * 0.2,
          ),
          Text(
            score,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int additionPoints = widget.scores[0]; // Update with your actual scores
    int memoryPoints = widget.scores[0]; // Update with your actual scores
    int attentionPoints = widget.scores[1]; // Update with your actual scores
    int visuospatialPoints = widget.scores[2]; // Update with your actual scores
    int executivePoints = widget.scores[3]; // Update with your actual scores

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.38,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff644ef8),
                  Color(0xff27318c),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  "Your Result",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ClipOval(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 132, 114, 246),
                          Color.fromARGB(255, 101, 115, 234),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          totalScore.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Of 1000",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                if (totalScore < 1000)
                  RatingBarIndicator(
                    rating: (totalScore / 1000) * 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 35.0,
                    direction: Axis.horizontal,
                  ),
                if (totalScore == 1000)
                  RatingBarIndicator(
                    rating: 10,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 10,
                    itemSize: 25,
                    direction: Axis.horizontal,
                  ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: Text(
                    getRandomTagline(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.035,
                vertical: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          summaryItem(
                            height,
                            width,
                            Colors.amber.shade100,
                            Colors.amber.shade800,
                            "assets/images/reasoning.png",
                            "Reasoning",
                            "$additionPoints/200",
                          ),
                          SizedBox(height: height * 0.02),
                          summaryItem(
                            height,
                            width,
                            Colors.orange.shade200,
                            Colors.orange.shade800,
                            "assets/images/memory.png",
                            "Memory",
                            "$memoryPoints/200",
                          ),
                          SizedBox(height: height * 0.02),
                          summaryItem(
                            height,
                            width,
                            Colors.red.shade100,
                            Colors.red.shade800,
                            "assets/images/attention_dark.png",
                            "Attention",
                            "$attentionPoints/200",
                          ),
                          SizedBox(height: height * 0.02),
                          summaryItem(
                            height,
                            width,
                            Colors.blue.shade100,
                            Colors.blue.shade800,
                            "assets/images/visual.png",
                            "Visuospatial",
                            "$visuospatialPoints/200",
                          ),
                          SizedBox(height: height * 0.02),
                          summaryItem(
                            height,
                            width,
                            Colors.green.shade100,
                            Colors.green.shade800,
                            "assets/images/executive.png",
                            "Executive Functioning",
                            "$executivePoints/200",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.grey.shade200,
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.grey.shade200,
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: width * 0.1),
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.restart_alt,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
        ],
      ),
    );
  }
}
