import 'package:flutter/material.dart';


class Questionwise extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                         Text(
                             'Chapter Name',
                              style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.white,
                                 fontWeight: FontWeight.normal,
                              ),
                         ),
                    ],
                ),

                backgroundColor: const Color.fromARGB(255, 16, 12, 148),
            ),
            body: Center(
                child: Container(
                     
                ),
            ),
        );
    }
}
