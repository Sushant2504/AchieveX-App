

// import 'package:achievex/provider/subscription_provider.dart';
// import 'package:achievex/ui/theme.dart';
// import 'package:flutter/material.dart';

// Widget SubscripitonPlanWidet(BuildContext context,SubscriptionProvider subscriptionProvider,String price,String days,String ){

//   return  Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: AppColors.formBgColor,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5), // Shadow color
//                         spreadRadius: 2, // Spread radius
//                         blurRadius: 2, // Blur radius
//                         offset: const Offset(0, 1), // Offset of the shadow
//                       ),
//                     ],
//                   ),
//                   child: InkWell(
//                     onTap: () => {
                     
//                       subsciptionProvider.startSubscribe(99, 30, context),
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset(
//                             'assets/images/badge.png',
//                             height: 19,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(left: 8.0),
//                           child: Text(
//                             '99/ -',
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(left: 8.0),
//                           child: Text('Monthly'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
             
// }