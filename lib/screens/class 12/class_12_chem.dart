import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:achievex/utils/chapter_name.dart';

class Class12Chem extends StatelessWidget {
  const Class12Chem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[0]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[1]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[2]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[3]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[4]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[5]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[6]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[7]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[8]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[9]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[10]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[11]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[12]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[13]),
              ),
            ),

            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.Instruction),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChapterCard(height, width, context, C_12_Chapters[14]),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget ChapterCard(var height, var width, context, String title) {
    return Container(
      height: height * 0.1,
      width: width,

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 193, 225, 252),
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(
            width: 9.0,
          ),
          const Icon(
            Icons.arrow_forward,
            size: 45.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
