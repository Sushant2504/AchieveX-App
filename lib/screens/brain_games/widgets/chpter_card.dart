// import 'package:flutter/material.dart';

// abstract class ChapterCard extends StatelessWidget{

//   @override
//   Widget BuildContext(context) {
//       return Scaffold();
//   }

//   Widget ChapterCard(var height, var width, context, String title) {
//     return Container(
//       height: height * 0.2,
//       width: width,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,

//         children: [

//             Text(
//                title,
//                style: TextStyle(
//                   fontSize: 20, 
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.normal,
//                 ),
//             ),

//             const SizedBox(width: 8.0,),

//             Icon(
//               Icons.arrow_forward,
//               size: 40.0,
//               color: Colors.grey,
//             ),


//         ],
//       ),
//     );
//   }

// }