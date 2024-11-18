import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class Class_12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: const Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      'Choose the',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Prompt-Bold',
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 90.0),
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
            const SizedBox(height: 5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Phy),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE MAIN",
                  subtitle: "TopicWise PYQS (Physics)",
                  containerColor: Colors.blue),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Chem),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE MAIN",
                  subtitle: "TopicWise PYQS (Chemistry)",
                  containerColor: Colors.blue),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Math),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE MAIN",
                  subtitle: "TopicWise PYQS (Maths)",
                  containerColor: Colors.blue),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.instructiontScreen),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE MAIN",
                  subtitle: "Full Test",
                  containerColor: Colors.yellow),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Phy),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE ADAVANCED",
                  subtitle: "TopicWise PYQS (Physics)",
                  containerColor: Colors.blue),
            ),

            const SizedBox(height: 5),

            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Chem),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE ADAVANCED",
                  subtitle: "TopicWise PYQS (Chemistry)",
                  containerColor: Colors.blue),
            ),

            const SizedBox(height: 5),

            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.Class12Math),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE ADAVANCED",
                  subtitle: "TopicWise PYQS (Maths)",
                  containerColor: Colors.blue),
            ),

            const SizedBox(height: 5),

            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.instructiontScreen),
              child: CustomCard(
                  imagePath: "assets/images/11th_class.png",
                  title: "JEE ADAVANCED",
                  subtitle: "Full Test",
                  containerColor: Colors.yellow),
            ),

            const SizedBox(height: 5),
            
          ],
        ),
      ),
    );
  }

  Widget CustomCard({
    required String imagePath,
    bool isPremium = false,
    required String title,
    required String subtitle,
    required Color containerColor,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 110,
          width: 470,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(imagePath),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
