import 'package:flutter/material.dart';

class NeuroResult extends StatelessWidget {
  final List<int> scores;
  final List<String> gameNames;
  final List<String> gameImages;
  final Map<String, double> percentages;
  final Map<String, double> differences;

  const NeuroResult({
    super.key,
    required this.scores,
    required this.gameNames,
    required this.gameImages,
    required this.percentages,
    required this.differences,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.12,
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Your Result",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/images/result.png",
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  String gameName = gameNames[index];
                  String gameImage = gameImages[index];
                  double percentage = percentages[gameName]!;
                  double difference = differences[gameName]!;

                  Color differenceColor =
                      difference >= 0 ? Colors.green : Colors.red;
                  String differenceArrow = difference >= 0 ? '↑' : '↓';

                  return Card(
                    child: ListTile(
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            gameImage,
                            height: height * 0.05,
                          ),
                          Text(gameName),
                          Text(
                            '${percentage.toStringAsFixed(2)}%',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text:
                                      '${difference.toStringAsFixed(2)}% $differenceArrow',
                                  style: TextStyle(color: differenceColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NeuroResult extends StatefulWidget {
//   final List<int> scores;
//   final List<String> gameTitles;
//   final List<String> gameImages;

//   const NeuroResult({
//     Key? key,
//     required this.scores,
//     required this.gameTitles,
//     required this.gameImages,
//   }) : super(key: key);

//   @override
//   State<NeuroResult> createState() => _NeuroResultState();
// }

// class _NeuroResultState extends State<NeuroResult> {
//   late int totalScore;
//   List<int> maxScores = [200, 200, 200]; // Maximum scores for each game

//   List<double> _currentPercentages = [
//     0,
//     0,
//     0
//   ]; // Current percentage for each game
//   List<double> _pastRecordPercentages = [
//     0,
//     0,
//     0
//   ]; // Past record percentage for each game
//   List<double> _percentageDifferences = [
//     0,
//     0,
//     0
//   ]; // Percentage difference for each game

//   @override
//   void initState() {
//     super.initState();
//     totalScore = widget.scores.reduce((a, b) => a + b); // Calculate total score

//     // Calculate the current percentages
//     _currentPercentages = widget.scores
//         .asMap()
//         .map(
//             (index, score) => MapEntry(index, (score / maxScores[index]) * 100))
//         .values
//         .toList();

//     // Load past record percentages from storage
//     _loadPastRecordPercentages();
//   }

//   // Load past record percentages from storage
//   Future<void> _loadPastRecordPercentages() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _pastRecordPercentages = [
//         prefs.getDouble('game1_percentage') ?? 0,
//         prefs.getDouble('game2_percentage') ?? 0,
//         prefs.getDouble('game3_percentage') ?? 0,
//       ];
//       // Calculate percentage differences between current and past record percentages
//       _calculatePercentageDifferences();
//     });
//   }

//   // Calculate percentage differences between current and past record percentages
//   void _calculatePercentageDifferences() {
//     for (int i = 0; i < _currentPercentages.length; i++) {
//       _percentageDifferences[i] =
//           _currentPercentages[i] - _pastRecordPercentages[i];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: height * 0.12,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xff644ef8),
//                   Color(0xff27318c),
//                 ],
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.05,
//                 vertical: height * 0.02,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const Text(
//                     "Your Result",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Image.asset(
//                     "assets/images/result.png",
//                     height: height * 0.05,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.035,
//                 vertical: height * 0.02,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Summary",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           for (int i = 0; i < widget.gameTitles.length; i++)
//                             Column(
//                               children: [
//                                 summaryItem(
//                                   height,
//                                   width,
//                                   _currentPercentages[i],
//                                   _percentageDifferences[i],
//                                   widget.gameImages[i],
//                                   widget.gameTitles[i],
//                                   widget.scores[i],
//                                 ),
//                                 SizedBox(
//                                   height: height * 0.05,
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     Colors.grey.shade200,
//                   ),
//                   padding: MaterialStateProperty.all(
//                     EdgeInsets.symmetric(
//                       horizontal: width * 0.1,
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.popUntil(context, (route) => route.isFirst);
//                 },
//                 icon: const Icon(
//                   Icons.home,
//                   size: 30,
//                 ),
//               ),
//               IconButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     Colors.grey.shade200,
//                   ),
//                   padding: MaterialStateProperty.all(
//                     EdgeInsets.symmetric(horizontal: width * 0.1),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.popUntil(context, (route) => route.isFirst);
//                 },
//                 icon: const Icon(
//                   Icons.restart_alt,
//                   size: 30,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: height * 0.015,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget summaryItem(
//     double height,
//     double width,
//     double currentPercentage,
//     double percentageDifference,
//     String imagePath,
//     String title,
//     int score,
//   ) {
//     return Container(
//       height: height * 0.07,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey.shade200,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset(
//             imagePath,
//             height: height * 0.05,
//           ),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             width: width * 0.10,
//           ),
//           Text(
//             "${currentPercentage.toStringAsFixed(1)}%",
//             style: const TextStyle(
//               fontSize: 25,
//               color: Colors.green,
//             ),
//           ),
//           SizedBox(
//             width: width * 0.03,
//           ),
//           Text(
//             "${percentageDifference.toStringAsFixed(1)}%",
//             style: TextStyle(
//               fontSize: 16,
//               color: percentageDifference >= 0 ? Colors.green : Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
