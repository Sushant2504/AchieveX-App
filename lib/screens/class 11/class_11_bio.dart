import 'package:flutter/material.dart';
import 'package:achievex/utils/chapter_name.dart';

class Class11Bio extends StatelessWidget {
  @override
  Widget BuildContext(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.separated(
          itemCount: M_11_Chapters.length,
          separatorBuilder: (context, int index) => const Divider(),
          itemBuilder: (context, int index) {
            return ChapterCard(height, width, context, B_11_Chapters[index]);
          },
        ),
      ),
    );
  }

  Widget ChapterCard(var height, var width, context, String title) {
    return Container(
      height: height * 0.2,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

            Text(
               title,
               style: TextStyle(
                  fontSize: 20, 
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
            ),

            const SizedBox(width: 9.0,),

            Icon(
              Icons.arrow_forward,
              size: 45.0,
              color: Colors.grey,
            ),


        ],
      ),
    );
  }
  
  @override
  Widget build(context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
