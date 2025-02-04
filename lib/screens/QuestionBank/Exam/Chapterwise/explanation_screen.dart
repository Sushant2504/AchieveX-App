import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class ExaplanationScreen extends StatelessWidget {
     final List<List<dynamic>> paper;
     final int index;

     const ExaplanationScreen({
       required this.paper,
       required this.index,
       super.key, 
     });


     @override

     Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

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
                          'See the',
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
                          'Explanation',
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
                          'assets/images/question_in.png',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.57,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 5, 
                        blurRadius: 5, 
                        offset: const Offset(0, 3), 
                      ),

                      
                    ],
                  ),


                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                       child: Text(
                        paper[index][18],
                         style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins",
                            color: Colors.black,
                         ),
                       ),
                    ),
                  ),
                ),


                const SizedBox(
                  height: 95.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                        Navigator.pop(context);
                    },
                    child: _Button("Back", null),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}







Widget _Button(String text, IconData? icon) {
    return Container(
      height: 70,
      width: 330,
      decoration: BoxDecoration(
        color: HexColor("#5C76FF"),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), 
            spreadRadius: 5, 
            blurRadius: 5, 
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon, // Use ! to assert that icon is not null
              size: 18, // Adjust icon size as needed
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
 
}